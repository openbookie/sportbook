
class CalcRound < Round

  def after_initialize
    self.calc = true    # make sure calc flag is true
  end

  def title
    "#{read_attribute(:title)} (Calc)"   # add (calc) marker to title
  end
  
    
end  # class CalcRound