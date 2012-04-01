# == Schema Information
#
# Table name: plays
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  pool_id    :integer         not null
#  team1_id   :integer
#  team2_id   :integer
#  team3_id   :integer
#  total_pts  :integer         default(0), not null
#  total_pos  :integer         default(0), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Play < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :team3, :class_name => 'Team', :foreign_key => 'team3_id'
  
  after_create :log_action_create

  ## after_update :log_action_update
  
  def log_action_create
    a = Action.new

    a.user_id = user_id
    a.pool_id = pool_id
    a.tmpl    = 'play-create'
    a.text    = "#{user.name} tippt mit im Wettpool >#{pool.full_title}<. Willkommen!"

    a.save!
  end
  
  
  def log_action_team_update!
    
    # note: cannot use after_update filter
    #  - cached total_pts and total_pos updates also trigger filter!
    #  todo: is there a way to check old and new values?
    
    # only log if we got at least one team
    return if team1_id.blank? && team2_id.blank? && team3_id.blank?
    
    a = Action.new

    a.user_id = user_id
    a.pool_id = pool_id
    a.tmpl    = 'play-update'
    
    buf = ""
    buf << "#{user.name} tippt "
    buf << "1. Platz => #{team1.title} " if team1.present?
    buf << "2. Platz => #{team2.title} " if team2.present?
    buf << "3. Platz => #{team3.title} " if team3.present?
    buf << " im Wettpool >#{pool.full_title}<."
    
    a.text = buf
    a.save!
  end
  
  
  
  ## todo/fix: can it be done w/ a has_many macro and a condition?
  def tips
    recs = Tip.where( :pool_id => pool_id, :user_id => user_id ).all
    recs
  end

  ## todo/fix: can it be done w/ a has_many macro and a condition?
  def complete_rankings  # fix rename to points and remove points column from play table??
    recs = Point.where( :pool_id => pool_id, :user_id => user_id ).joins( :round ).where('rounds.calc=?', false).order('rounds.pos').all
    recs
  end

  def export?
    # check if user entered some data
    # - do NOT export nil records (all teams blank)
    
    (team1_id.blank? && team2_id.blank? && team3_id.blank?)==false
  end
  
end   # class Play
