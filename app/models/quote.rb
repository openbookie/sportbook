
class Quote < ActiveRecord::Base
    
  belongs_to :service
  belongs_to :game
    
end  # class Quote