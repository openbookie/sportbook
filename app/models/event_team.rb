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

EventTeam = SportDb::Model::EventTeam

