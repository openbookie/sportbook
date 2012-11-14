# == Schema Information
#
# Table name: teams
#
#  id           :integer         not null, primary key
#  title        :string(255)     not null
#  key          :string(255)     not null
#  img          :string(255)
#  tag          :string(255)
#  type         :string(255)
#  calc         :boolean         default(FALSE), not null
#  calc_rule    :string(255)
#  calc_value   :string(255)
#  calc_team_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#


module SportDB::Models

class Team

  def self.update_image_from_ary!( teams )
    teams.each do |values|

      team = Team.find_by_key!( values[0])
      
      attr = {
        :img   => values[1]
      }

      team.update_attributes!( attr )
      
    end # each team
  end

  def calc?
    calc == true
  end
  
end  # class Team

end # module SportDB::Models

Team = SportDB::Models::Team

