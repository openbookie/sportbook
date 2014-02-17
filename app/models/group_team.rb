# == Schema Information
#
# Table name: groups_teams
#
#  id         :integer         not null, primary key
#  group_id   :integer         not null
#  team_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


GroupTeam = SportDb::Model::GroupTeam

