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


BonusRound = SportDb::Model::BonusRound
