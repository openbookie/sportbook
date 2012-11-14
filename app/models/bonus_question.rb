# == Schema Information
#
# Table name: bonus_questions
#
#  id         :integer         not null, primary key
#  round_id   :integer         not null
#  title      :string(255)     not null
#  pos        :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class BonusQuestion < ActiveRecord::Base
  
  self.table_name = 'bonus_questions'

  has_many :tips, :class_name => 'BonusTip', :foreign_key => 'question_id'

end # class BonusQuestion
