# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  start_at   :datetime
#  team3      :boolean         default(TRUE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  key        :string(255)
#


class Event < ActiveRecord::Base
  
  has_many :rounds, :order => 'pos'
  
  has_many :event_teams, :class_name => 'EventTeam'
  has_many :teams, :through => :event_teams

end # class Event
