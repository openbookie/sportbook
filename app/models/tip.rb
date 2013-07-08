# encoding: utf-8

# == Schema Information
#
# Table name: tips
#
#  id            :integer         not null, primary key
#  user_id       :integer         not null
#  pool_id       :integer         not null
#  game_id       :integer         not null
#  score1        :integer
#  score2        :integer
#  score3        :integer
#  score4        :integer
#  score5        :integer
#  score6        :integer
#  toto12x       :string(255)
#  type          :string(255)
#  calc          :boolean         default(FALSE), not null
#  calc_team1_id :integer
#  calc_team2_id :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

module SportDb::Models

## NB: extend from sport.db-play gem

class Tip 
  
  after_save  :log_action

  def log_action
    # add news feed item after save
    
    # only log complete tips
    return if toto12x.nil?
    
    a = Action.new

    ## todo: add pool_id
    a.user_id = user_id
    a.tip_id  = id
    a.tmpl    = 'tip'
    a.text    = "#{user.name} tippt [#{toto12x}] #{game.team1.title} #{score_str} #{game.team2.title} (#{game.round.title}) im Wettpool >#{pool.full_title}<."

    a.save!
  end


  def public_user_name_str
    public? ? user.name : 'Anonymous'
  end

  def public_score_str
    public? ? score_str : '# : #'
  end
  
  def public_toto12x_str
    public? ? toto12x : '#'
  end
  
end # class Tip

end  # module SportDb::Models

Tip = SportDb::Models::Tip
