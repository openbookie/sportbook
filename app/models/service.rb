# == Schema Information
#
# Table name: services
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  key        :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


Service = SportDb::Model::Service
