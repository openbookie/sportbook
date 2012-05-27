
class TeamQuote < ActiveRecord::Base
  
  self.table_name = 'team_quotes'
  
  belongs_to :service
  belongs_to :event
  belongs_to :team

end  # class TeamQuote