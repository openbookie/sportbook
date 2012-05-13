
class CalcTip < Tip

  after_initialize :do_after_initialize

  belongs_to :calc_team1, :class_name => 'Team', :foreign_key => 'calc_team1_id'
  belongs_to :calc_team2, :class_name => 'Team', :foreign_key => 'calc_team2_id'

private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end
    
end  # class CalcTip