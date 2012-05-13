
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