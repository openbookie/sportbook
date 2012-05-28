
class Service < ActiveRecord::Base
    
    
   has_many :event_quotes, :order => 'odds'   # event_(team)_quotes
    
end  # class Service