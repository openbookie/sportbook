# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Event < ActiveRecord::Base
  
  has_many :game_groups
  
  has_many :event_teams, :class_name => 'EventTeam'
  has_many :teams, :through => :event_teams

end # class Event
