# == Schema Information
#
# Table name: rounds
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  title2     :string(255)
#  pos        :integer         not null
#  knockout   :boolean         default(FALSE), not null
#  start_at   :datetime        not null
#  end_at     :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  flex       :boolean         default(TRUE), not null
#  fix        :boolean         default(TRUE), not null
#  type       :string(255)
#  calc       :boolean         default(FALSE), not null
#

module SportDb
  module Model

class Round
    
  def calc?    # todo/fix: already supported by default by framework? check
    calc == true
  end
  
end # class Round

  end # module Model
end # module SportDb

Round = SportDb::Model::Round

