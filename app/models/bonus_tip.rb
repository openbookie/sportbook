
class BonusTip < ActiveRecord::Base
  
  self.table_name = 'bonus_tips'

  belongs_to :user

end # class BonusTip
