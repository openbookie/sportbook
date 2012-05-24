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


class Team < ActiveRecord::Base

  def calc?
    calc == true
  end
    
  def key
     # generate key if necessary (for debugging only - should be not null field!)
     value = read_attribute(:key)
     value = "?#{title.downcase.gsub( /\s/, '_').gsub( /[^a-z0-9_]/, '*' )}?"  if value.blank?
     value
  end  
  
end  # class Team
