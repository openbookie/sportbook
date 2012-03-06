# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  img        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Team < ActiveRecord::Base

  def self.attributes_protected_by_default
        # default is ["id", "type"]
        ["type"]
  end
  
  
end
