# == Schema Information
#
# Table name: events_teams
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  team_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class EventTeam < ActiveRecord::Base
  self.table_name = 'events_teams'
  
  belongs_to :event
  belongs_to :team
end
