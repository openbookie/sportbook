# == Schema Information
#
# Table name: event_quotes
#
#  id         :integer         not null, primary key
#  service_id :integer         not null
#  event_id   :integer         not null
#  team_id    :integer         not null
#  odds       :decimal(, )     not null
#  comments   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


EventQuote = SportDb::Model::EventQuote

