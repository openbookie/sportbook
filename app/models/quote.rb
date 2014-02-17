# == Schema Information
#
# Table name: quotes
#
#  id         :integer         not null, primary key
#  service_id :integer         not null
#  game_id    :integer         not null
#  odds1      :decimal(, )     not null
#  oddsx      :decimal(, )     not null
#  odds2      :decimal(, )     not null
#  comments   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


Quote = SportDb::Model::Quote
