class EventTeam < ActiveRecord::Base
  set_table_name 'events_teams'
  
  belongs_to :event
  belongs_to :team
end