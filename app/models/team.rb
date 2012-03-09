# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  img        :string(255)
#  calc       :boolean         default(FALSE), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Team < ActiveRecord::Base

  def calc?
    self.calc == true
  end
  
end
