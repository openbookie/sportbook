
class CalcRound < Round

  after_initialize :do_after_initialize

  def title
    "#{read_attribute(:title)} (Calc)"   # add (calc) marker to title
  end


private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end
    
end  # class CalcRound