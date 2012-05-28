
class GroupQuote < ActiveRecord::Base
  
  self.table_name = 'group_quotes'
  
  belongs_to :service
  belongs_to :group
  belongs_to :team

end  # class GroupQuote