
class CalcTeam < Team


  def after_initialize
    self.calc = true    # make sure calc flag is true
  end

  def title
    "[#{read_attribute(:title)}]"   # wrap title in []
  end

    
end  # class CalcTeam