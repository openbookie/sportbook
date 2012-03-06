# == Schema Information
#
# Table name: tips
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  pool_id    :integer         not null
#  game_id    :integer         not null
#  score1     :integer
#  score2     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tip < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  belongs_to :game
  
end
