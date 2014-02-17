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

BonusQuestion = SportDb::Model::BonusQuestion

