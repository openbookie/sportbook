# == Schema Information
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  event_id   :integer         not null
#  title      :string(255)     not null
#  pos        :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


Group = SportDb::Model::Group
