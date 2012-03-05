
class Team < ActiveRecord::Base

  def self.attributes_protected_by_default
        # default is ["id", "type"]
        ["type"]
  end
  
  
end
