# == Schema Information
#
# Table name: pools
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  user_id    :integer         not null
#  fix        :boolean         default(FALSE), not null
#  welcome    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  key        :string(255)
#

class Pool < ActiveRecord::Base
  
  belongs_to :user   # is owner/admin/manager  
  
  has_many :plays   # pools_users join table
    
  ## rename to users from players??
  has_many :players, :through => :plays, :source => :user

  belongs_to :event
  
  after_create :log_action_create
  
  def log_action_create
    a = Action.new

    a.user_id = user_id
    a.pool_id = id
    a.tmpl    = 'pool-create'
    a.text    = "#{user.name} managt Wettpool >#{full_title}<. Mach mit! Tipp mit!"

    a.save!
  end
  
  
  
  def full_title
    "#{title} #{event.title} #{fix? ? 'Fix' : 'Flex'}"
  end
  
  def fix?
    fix == true
  end
  
  def flex?
    fix != true
  end
  
  def team3?    # tip for 3rd place?
    event.team3 == true
  end
  
end
