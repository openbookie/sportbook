# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Event < ActiveRecord::Base
  
  has_many :game_groups
  
end
