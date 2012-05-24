# == Schema Information
#
# Table name: actions
#
#  id         :integer         not null, primary key
#  text       :text
#  tmpl       :string(255)
#  user_id    :integer
#  event_id   :integer
#  pool_id    :integer
#  game_id    :integer
#  tip_id     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Action < ActiveRecord::Base


  belongs_to :event
  belongs_to :game
  belongs_to :user
  belongs_to :pool
  belongs_to :tip
    
end  # class Action


