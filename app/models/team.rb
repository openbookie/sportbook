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
#  key        :string(255)
#


class Team < ActiveRecord::Base

  def calc?
    calc == true
  end
  
  def title
    if calc?
      "[#{read_attribute(:title)}]"   # wrap title in []
    else
      read_attribute(:title)
    end
  end
  
  def key
     # generate key if necessary (for debugging only - should be not null field!)
     value = read_attribute(:key)
     value = "?#{title.downcase.gsub( /\s/, '_').gsub( /[^a-z0-9_]/, '*' )}?"  if value.blank?
     value
  end  
  
end  # class Team
