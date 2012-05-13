
class CalcTip < Tip

  after_initialize :do_after_initialize


private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end
    
end  # class CalcTip