
class Group < ActiveRecord::Base
    
  has_many :games, :order => 'pos'
  belongs_to :event
  
  has_many :group_teams, :class_name => 'GroupTeam'
  has_many :teams, :through => :group_teams
      
end # class Group