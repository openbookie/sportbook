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
  
  has_many :rounds, :order => 'pos'  # all (fix and flex) rounds
  
  has_many :fix_rounds,  :conditions => { :fix => true },  :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'
  has_many :fix_playoff_rounds, :conditions => { :fix => true , :playoff => true }, :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'

  has_many :flex_rounds, :conditions => { :flex => true }, :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'
  
  has_many :groups, :order => 'pos'
  
  has_many :event_teams, :class_name => 'EventTeam'
  has_many :teams, :through => :event_teams

end # class Event
