
class CalcTeam < Team

  after_initialize :do_after_initialize

  def title
    "[#{read_attribute(:title)}]"   # wrap title in []
  end

private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end

    
end  # class CalcTeam