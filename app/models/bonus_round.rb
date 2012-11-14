# == Schema Information
#
# Table name: bonus_rounds
#
#  id         :integer         not null, primary key
#  pool_id    :integer         not null
#  title      :string(255)     not null
#  pos        :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class BonusRound < ActiveRecord::Base
  
  self.table_name = 'bonus_rounds'
  
  has_many :questions,  :order => 'pos', :class_name => 'BonusQuestion', :foreign_key => 'round_id'
  belongs_to :pool

end # class BonusRound
