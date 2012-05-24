# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  email           :string(255)     not null
#  password_digest :string(255)
#  key             :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  
  has_many :pools
  has_many :tips
  
  has_secure_password   # use built-in rails macro for password to password_digest machinery
end
