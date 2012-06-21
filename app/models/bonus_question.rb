
class BonusQuestion < ActiveRecord::Base
  
  self.table_name = 'bonus_questions'

  has_many :tips, :class_name => 'BonusTip', :foreign_key => 'question_id'

end # class BonusQuestion
