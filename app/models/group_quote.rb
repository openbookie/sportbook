# == Schema Information
#
# Table name: group_quotes
#
#  id         :integer         not null, primary key
#  service_id :integer         not null
#  group_id   :integer         not null
#  team_id    :integer         not null
#  odds       :decimal(, )     not null
#  comments   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#



GroupQuote = SportDb::Model::GroupQuote

