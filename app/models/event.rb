# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  key        :string(255)     not null
#  league_id  :integer         not null
#  season_id  :integer         not null
#  start_at   :datetime        not null
#  end_at     :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  team3      :boolean         default(TRUE), not null
#


module SportDb::Model

class Event
  
  has_many :fix_rounds,  :conditions => { :fix => true },  :order => 'pos', :class_name => 'SportDb::Model::Round', :foreign_key => 'event_id'
  has_many :fix_playoff_rounds, :conditions => { :fix => true , :playoff => true }, :order => 'pos', :class_name => 'SportDb::Model::Round', :foreign_key => 'event_id'

  has_many :flex_rounds, :conditions => { :flex => true }, :order => 'pos', :class_name => 'SportDb::Model::Round', :foreign_key => 'event_id'

end  # class Event

end # module SportDb::Model

Event = SportDb::Model::Event
