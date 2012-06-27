
class BonusRound < ActiveRecord::Base
  
  self.table_name = 'bonus_rounds'
  
  has_many :questions,  :order => 'pos', :class_name => 'BonusQuestion', :foreign_key => 'round_id'
  belongs_to :pool

end # class BonusRound
