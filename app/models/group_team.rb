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


class GroupTeam < ActiveRecord::Base
  self.table_name = 'groups_teams'
  
  belongs_to :group
  belongs_to :team
end
