
class Action < ActiveRecord::Base


  belongs_to :event
  belongs_to :game
  belongs_to :user
  belongs_to :pool
  belongs_to :tip
    
end  # class Action


