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


class PoolUser < ActiveRecord::Base
  set_table_name 'pools_users'
  
  belongs_to :user
  belongs_to :pool
end
