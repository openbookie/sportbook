class User < ActiveRecord::Base
  
  has_many :pools
  has_many :tips
  
  accepts_nested_attributes_for :tips
  
end
