# == Schema Information
#
# Table name: props
#
#  id         :integer         not null, primary key
#  key        :string(255)     not null
#  value      :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

Prop = ConfDb::Model::Prop

