class Tip < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  belongs_to :game
  
end
