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
    
  has_many :games, :order => 'pos'
  belongs_to :event
  
  def calc?    # todo/fix: already supported by default by framework? check
    calc == true
  end
  
end # class Round
