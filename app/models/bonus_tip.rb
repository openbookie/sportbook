# == Schema Information
#
# Table name: bonus_tips
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  question_id :integer         not null
#  pts         :integer         default(0), not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#


BonusTip = SportDb::Model::BonusTip

