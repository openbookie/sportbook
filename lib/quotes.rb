
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
    
    @service = Service.find_by_key!( service_key )
    @event   = Event.find_by_key!( event_key )
    
    puts "Quote Service #{@service.key} >#{@service.title}<"
    puts "Event #{@event.key} >#{@event.title}<"


    ## build known teams table w/ synonyms e.g.
    #
    #   nb: synonyms can be a regex not just a literal string
    # [[ 'wolfsbrug', [ 'VfL Wolfsburg' ]],
    #  [ 'augsburg',  [ 'FC Augsburg', 'Augi2', 'Augi3' ]],
    #  [ 'stuttgart', [ 'VfB Stuttgart' ]] ]
    
    ### todo/fix: move known_teams code to model and reuse in readers!!
    ##    do NOT duplicate
    
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
  
  def find_quotes!( line )
    # extract quotes triplet from line
    # and return it
    # NB: side effect - removes quotes triplet from line string
    
    # e.g. 1,55  3,55  6,44
    
    # NB: (?:)  is used for non-capturing grouping
    
    ## regex1 uses point., e.g. 1.55 for separator
    ## regex2 uses comma-, e.g. 1,55 for separator

    
    regex1 = /[ \t]+(\d{1,3}(?:\.\d{1,3})?)[ \t]+(\d{1,3}(?:\.\d{1,3})?)[ \t]+(\d{1,3}(?:\.\d{1,3})?)/
    regex2 = /[ \t]+(\d{1,3}(?:,\d{1,3})?)[ \t]+(\d{1,3}(?:,\d{1,3})?)[ \t]+(\d{1,3}(?:,\d{1,3})?)/
    
    if line =~ regex1
      values = [$1.to_f, $2.to_f, $3.to_f]
      puts "   quotes: >#{values.join('|')}<"
      
      line.sub!( regex1, ' [QUOTES.EN]' )

      return values
    elsif line =~ regex2
      values = [$1.tr(',','.').to_f,
                $2.tr(',','.').to_f,
                $3.tr(',','.').to_f]
      puts "   quotes: >#{values.join('|')}<"
      
      line.sub!( regex2, ' [QUOTES.DE]' )

      return values
    else
      return nil
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
        
        match_teams!( line )
        team1_key = find_team1!( line )
        team2_key = find_team2!( line )

        quotes = find_quotes!( line )

        puts "  line: >#{line}<"


        ### todo: cache team lookups in hash?

        team1 = Team.find_by_key!( team1_key )
        team2 = Team.find_by_key!( team2_key )

        ### check if games exists
        ##  with this teams in this round if yes only update
        game = Game.find_by_round_id_and_team1_id_and_team2_id!(
                         @round.id, team1.id, team2.id
        )
        
        quote_attribs = {
          odds1: quotes[0],
          oddsx: quotes[1],
          odds2: quotes[2]
        }
        
        quote = Quote.find_by_service_id_and_game_id( @service.id, game.id )

        if quote.present?
          puts "*** update quote #{quote.id}:"
        else
          puts "*** create quote:"
          quote = Quote.new
          
          more_quote_attribs = {
            service_id:  @service.id,
            game_id:     game.id
          }
          quote_attribs = quote_attribs.merge( more_quote_attribs )
        end

        puts quote_attribs.to_json

        quote.update_attributes!( quote_attribs )
      end
    end # oldlines.each
    
  end # method parse_quotes

end # class QuotesReader