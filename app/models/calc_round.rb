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


class CalcRound < Round

  after_initialize :do_after_initialize

  def title
    "#{read_attribute(:title)} (Calc)"   # add (calc) marker to title
  end


private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
    
    self.fix  = true    # mark for use for fix pools only; do NOT use in flex pools 
    self.flex = false
  end
    
end  # class CalcRound

