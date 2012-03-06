
class PoolUser < ActiveRecord::Base
  set_table_name 'pools_users'
  
  belongs_to :user
  belongs_to :pool
end
