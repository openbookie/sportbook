# == Schema Information
#
# Table name: game_groups
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  pos        :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  calc       :boolean         default(FALSE)
#


class Round < ActiveRecord::Base
  
  ## todo/fix: rename table to rounds!!  
  set_table_name 'game_groups'
  
  ## todo/fix: rename game_group_id to round_id!!!  
  has_many :games, :order => 'pos', :foreign_key => 'game_group_id'
  belongs_to :event
  
  def calc?
    calc == true
  end
  
end # class Round
