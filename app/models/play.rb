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
  
  def log_action_create
    a = Action.new

    a.user_id = user_id
    a.pool_id = pool_id
    a.tmpl    = 'play-create'
    a.text    = "#{user.name} tippt mit im Wettpool >#{pool.full_title}<. Willkommen!"

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
