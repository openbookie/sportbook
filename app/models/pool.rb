class Pool < ActiveRecord::Base
  
  belongs_to :user   # is owner/admin/manager  
  
  has_many :pool_users, :class_name => 'PoolUser'
  has_many :players, :through => :pool_users, :source => :user  
  
end
