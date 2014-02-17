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


module SportDb::Model

### todo/fix: move more methods to sport.db for reuse


class Game

  before_save :log_activity


### todo/fix:  use new name - team1_style_class_w_calc in views

  def team1_style_class_w_calc
    buf = ''
    buf << team1_style_class
    buf << ' game-team-calc '    if team1.calc?     ## fix:todo: move calc flag to "standard/core" model 
    buf
  end

  def team2_style_class_w_calc
    buf = ''
    buf << team2_style_class
    buf << ' game-team-calc '    if team2.calc?      ## fix:todo: move calc flag to "standard/core" model 
    buf
  end


  def play_at_str_db
    puts "*** depreciated - use play_at_str( :db )"
    play_at_str( :db )
  end


  def log_activity
    # add news feed item after save
    
    # for now only log if user action (not background job)
    return if job_running?

    ## check if any changes
    
    return unless changed?


    a = Activity.new
    a.trackable_type = self.class.name
    a.trackable_id   = id
    a.tmpl    = 'game'

    a.action  = new_record?  ? 'create' : 'update'

    if winner90.nil?
      a.text = "*** NEWS - #{team1.title} - #{team2.title} #{locked? ? '(Locked Flag)':''}"
    else
      ## todo: add locked flag?
      a.text = "*** NEWS - [#{winner90}] #{team1.title} #{score_str} #{team2.title}"
    end

    a.save!
  end

end # class Game

end # module SportDb::Model

Game = SportDb::Model::Game
