
### load quotes from plain text files

class QuotesReader

  def initialize
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::INFO
  end

  attr_reader :logger

  def load( service_key, event_key, data )


    puts "working directory: #{Dir.pwd}"
 
    ## assume active activerecord connection
    ##
    
    @event = Event.find_by_key!( event_key )
    
    puts "Event #{@event.key} >#{@event.title}<"


    ## build known teams table w/ synonyms e.g.
    #
    #   nb: synonyms can be a regex not just a literal string
    # [[ 'wolfsbrug', [ 'VfL Wolfsburg' ]],
    #  [ 'augsburg',  [ 'FC Augsburg', 'Augi2', 'Augi3' ]],
    #  [ 'stuttgart', [ 'VfB Stuttgart' ]] ]
    
    @known_teams = []
 
    @event.teams.each_with_index do |team,index|

      titles = []
      titles << team.title
      titles += team.synonyms.split('|')  if team.synonyms.present?

      ## NB: sort here by length (largest goes first - best match)
      #  exclude tag and key (key should always go last)
      titles = titles.sort { |left,right| right.length <=> left.length }
      
      titles << team.tag                  if team.tag.present?
      titles << team.key
            
      @known_teams << [ team.key, titles ]
      
      puts "  Team[#{index+1}] #{team.key} >#{titles.join('|')}<"
    end
 
 
    parse_quotes( data )
    
    puts 'Done.'
    
  end   # method load


  def is_round?( line )
    line =~ /Spieltag|Runde/
  end
  
  def find_round_pos!( line )
    regex = /\b(\d+)\b/
    
    if line =~ regex
      value = $1.to_i
      puts "   pos: >#{value}<"
      
      line.sub!( regex, '[POS]' )

      return value
    else
      return nil
    end    
  end
  
  def find_date!( line )
    # extract date from line
    # and return it
    # NB: side effect - removes date from line string
    
    # e.g. 14.09. 20:30
    regex = /\b(\d{2})\.(\d{2})\.\s+(\d{2}):(\d{2})\b/
    
    if line =~ regex
      value = "2012-#{$2}-#{$1} #{$3}:#{$4}"
      puts "   date: >#{value}<"

      ## todo: lets you configure year
      ##  and time zone (e.g. cet, eet, utc, etc.)
      
      line.sub!( regex, '[DATE]' )

      return DateTime.strptime( value, '%Y-%m-%d %H:%M' )
    else
      return nil
    end
  end

  def find_score!( line )
    # extract score from line
    # and return it
    # NB: side effect - removes date from line string
    
    # e.g. 1:2 or 0:2 or 3:3
    regex = /\b(\d):(\d)\b/
    
    if line =~ regex
      value = "#{$1}-#{$2}"
      puts "   score: >#{value}<"
      
      line.sub!( regex, '[SCORE]' )

      return [$1.to_i,$2.to_i]
    else
      return []
    end
  end
  

  def find_team_worker!( line, index )
    regex = /@@oo([^@]+?)oo@@/     # e.g. everything in @@ .... @@ (use non-greedy +? plus all chars but not @, that is [^@])
    
    if line =~ regex
      value = "#{$1}"
      puts "   team#{index}: >#{value}<"
      
      line.sub!( regex, "[TEAM#{index}]" )

      return $1
    else
      return nil
    end
  end

  def find_team1!( line )
    find_team_worker!( line, 1 )
  end
  
  def find_team2!( line )
    find_team_worker!( line, 2 )
  end
  
  
  def match_team_worker!( line, key, values )
    values.each do |value|
      regex = Regexp.new( "\\b#{value}\\b" )   # wrap with world boundry (e.g. match only whole words e.g. not wac in wacker) 
      if line =~ regex
        puts "     match for team >#{key}< >#{value}<"
        # make sure @@oo{key}oo@@ doesn't match itself with other key e.g. wacker, wac, etc.
        line.sub!( regex, "@@oo#{key}oo@@" )
        return true    # break out after first match (do NOT continue)
      end
    end
    return false
  end

  def match_teams!( line )
    @known_teams.each do |rec|
      key    = rec[0]
      values = rec[1]
      match_team_worker!( line, key, values )
    end # each known_teams    
  end # method translate_teams!
  

  def parse_quotes( data )
    
    data.each_line do |line|
  
      if line =~ /^\s*#/
        # skip komments and do NOT copy to result (keep comments secret!)
        logger.debug 'skipping comment line'
        next
      end
        
      if line =~ /^\s*$/ 
        # kommentar oder leerzeile überspringen 
        logger.debug 'skipping blank line'
        next
      end

      # remove leading and trailing whitespace
      line = line.strip

      if is_round?( line )
        puts "parsing round line: >#{line}<"
        pos = find_round_pos!( line )
        puts "  line: >#{line}<"
        
        @round = Round.find_by_event_id_and_pos!( @event.id, pos )

        
      else
        puts "parsing game (fixture) line: >#{line}<"
        
        ## date  = find_date!( line )
        ## score = find_score!( line )
        
        match_teams!( line )
        team1 = find_team1!( line )
        team2 = find_team2!( line )

        puts "  line: >#{line}<"


        ### todo: cache team lookups in hash?

        team1_id = Team.find_by_key!( team1 ).id
        team2_id = Team.find_by_key!( team2 ).id

        ### check if games exists
        ##  with this teams in this round if yes only update
        @game = Game.find_by_round_id_and_team1_id_and_team2_id!(
                         @round.id, team1_id, team2_id
        )

      end
    end # oldlines.each
    
    
  end # method parse_quotes

end # class QuotesReader