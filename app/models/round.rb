# == Schema Information
#
# Table name: rounds
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  title2     :string(255)
#  pos        :integer         not null
#  playoff    :boolean         default(FALSE), not null
#  flex       :boolean         default(TRUE), not null
#  fix        :boolean         default(TRUE), not null
#  type       :string(255)
#  calc       :boolean         default(FALSE), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Round < ActiveRecord::Base
    
  has_many :games, :order => 'pos'
  belongs_to :event
  
  def calc?    # todo/fix: already supported by default by framework? check
    calc == true
  end
  
end # class Round
