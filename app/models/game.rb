# == Schema Information
#
# Table name: games
#
#  id            :integer         not null, primary key
#  game_group_id :integer         not null
#  team1_id      :integer         not null
#  team2_id      :integer         not null
#  play_at       :datetime        not null
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Game < ActiveRecord::Base

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :game_group
  
  def self.attributes_protected_by_default
        # default is ["id", "type"]
        ["type"]
  end

end
