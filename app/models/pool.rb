# == Schema Information
#
# Table name: pools
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  user_id    :integer         not null
#  welcome    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  fix        :boolean         default(FALSE)
#

class Pool < ActiveRecord::Base
  
  belongs_to :user   # is owner/admin/manager  
  
  has_many :plays   # pools_users join table
  
  ## rename to users from players??
  has_many :players, :through => :plays, :source => :user

  belongs_to :event
  
  def full_title
    "#{title} #{event.title}"
  end
  
  def fix?
    fix == true
  end
  
  def flex?
    fix != true
  end
  
  def team3?    # show tip for 3rd place?
    event.team3 == true
  end
  
end
