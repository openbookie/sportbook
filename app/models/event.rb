# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  start_at   :datetime
#  team3      :boolean         default(TRUE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  key        :string(255)
#


module SportDB::Models
  
class Event
  
  has_many :fix_rounds,  :conditions => { :fix => true },  :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'
  has_many :fix_playoff_rounds, :conditions => { :fix => true , :playoff => true }, :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'

  has_many :flex_rounds, :conditions => { :flex => true }, :order => 'pos', :class_name => 'Round', :foreign_key => 'event_id'

end  # class Event

end # module SportDB::Models

Event = SportDB::Models::Event
