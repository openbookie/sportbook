# == Schema Information
#
# Table name: pools_users
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  pool_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  team1_id   :integer
#  team2_id   :integer
#  team3_id   :integer
#  points     :integer
#


class Play < ActiveRecord::Base
  
  ## todo/fix: rename table to plays!!  
  set_table_name 'pools_users'
  
  belongs_to :user
  belongs_to :pool
  
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :team3, :class_name => 'Team', :foreign_key => 'team3_id'
  
  ## todo/fix: can it be done w/ a has_many macro?  
  def tips
    recs = Tip.where( :pool_id => pool.id, :user_id => user_id ).all
    recs
  end
  
end
