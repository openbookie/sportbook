# == Schema Information
#
# Table name: games
#
#  id           :integer         not null, primary key
#  round_id     :integer         not null
#  pos          :integer         not null
#  group_id     :integer
#  team1_id     :integer         not null
#  team2_id     :integer         not null
#  play_at      :datetime        not null
#  knockout     :boolean         default(FALSE), not null
#  home         :boolean         default(TRUE), not null
#  score1       :integer
#  score2       :integer
#  score3       :integer
#  score4       :integer
#  score5       :integer
#  score6       :integer
#  next_game_id :integer
#  prev_game_id :integer
#  toto12x      :string(255)
#  key          :string(255)
#  type         :string(255)
#  calc         :boolean         default(FALSE), not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#


module SportDB::Models

### todo/fix: move more methods to sport.db for reuse


class Game

  after_save :log_action

  def job_running!
    @job_running = true
  end
  
  def job_done!
    @job_running = false
  end

  def job_running?
    (@job_running ||= false) == true
  end

     
  def over?   # game over?
    play_at <= Time.now
  end
  
  def knockout?
    knockout == true
  end
  
  def complete?
    score1.present? && score2.present?
  end
  
  def score_str
    if score5.present? && score6.present?    # im Elfmeterschiessen i.E.?
      "#{score1_str} : #{score2_str} / #{score3} : #{score4} n.V. / #{score5} : #{score6} i.E."
    elsif score3.present? && score4.present?  # nach Verlaengerung n.V.?
      "#{score1_str} : #{score2_str} / #{score3} : #{score4} n.V."
    else
      "#{score1_str} : #{score2_str}"
    end
  end
  
  def score1_str
    if score1.blank? then '-' else score1.to_s end
  end

  def score2_str
    if score2.blank? then '-' else score2.to_s end
  end

  def team1_style_class
    buf = ''
    buf << 'game-team-calc '    if team1.calc? 
    buf << 'game-team-winner '  if complete? && (score1 >  score2)
    buf << 'game-team-draw '    if complete? && (score1 == score2)
    buf
  end
  
  def team2_style_class
    buf = ''
    buf << 'game-team-calc '    if team2.calc? 
    buf << 'game-team-winner '  if complete? && (score2 >  score1)
    buf << 'game-team-draw '    if complete? && (score2 == score1)
    buf
  end

  
  def tip_1_style_class
    toto12x == '1' ? ' bingo ' : ' '
  end
  
  def tip_2_style_class
    toto12x == '2' ? ' bingo ' : ' '
  end
  
  def tip_x_style_class
    toto12x == 'X' ? ' bingo ' : ' '
  end
  
  
  def play_at_str
    play_at.strftime( "%a. %d. %b. / %H:%M" )
  end

  def play_at_str_db
    # todo: find a better attrib name?? 
    # play_at.to_s(:db)  # not working: use implied utc timezone?
    play_at.strftime( '%Y-%m-%d %H:%M %z' )  # NB: removed seconds (:%S)
  end

  
  ############ some methods for stats
  
  def complete_tips
    tips.where( 'toto12x is not null' )
  end

  def complete_tips_1
    tips.where( 'toto12x is not null' ).where( :toto12x => '1' ).order( 'score1 desc,score2 desc')
  end

  def complete_tips_2
    tips.where( 'toto12x is not null' ).where( :toto12x => '2' ).order( 'score2 desc,score1 desc')
  end
  
  def complete_tips_x
    tips.where( 'toto12x is not null' ).where( :toto12x => 'X' ).order( 'score1 desc,score2 desc')
  end
  
  
  def incomplete_tips
    tips.where( 'toto12x is null' )
  end
  
  def tip_1_count
    complete_tips.where( :toto12x => '1' ).count()
  end
  
  def tip_2_count
    complete_tips.where( :toto12x => '2' ).count()
  end
  
  def tip_x_count
    complete_tips.where( :toto12x => 'X' ).count()
  end
  
  def tip_12x_count
    complete_tips.count()
  end

  def log_action
    # add news feed item after save
    
    # only log if user action (not background job)
    return if job_running?
    

    a = Action.new
    a.game_id = id
    a.tmpl    = 'game'

    if toto12x.nil?
      a.text = "*** NEWS - Spiel #{team1.title} - #{team2.title} #{locked? ? '(Locked Flag)':''}"
    else
      ## todo: add locked flag?
      a.text = "*** NEWS - Spiel [#{toto12x}] #{team1.title} #{score_str} #{team2.title}"
    end

    a.save!
  end

end # class Game

end # module SportDB::Models

Game = SportDB::Models::Game
