# == Schema Information
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  pos        :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Group < ActiveRecord::Base
    
  has_many :games, :order => 'pos'
  belongs_to :event
  
  has_many :group_teams, :class_name => 'GroupTeam'
  has_many :teams, :through => :group_teams
      
end # class Group
