

## simple wrapper; add output to StringIO plus outputs to STDOUT too
##   fix: move to text utils to utils ??
##   fix: find a better name? already exists anything similar ???

class StringIOWithEcho  

  def initialize
    @buf = StringIO.new
  end

  def puts( msg )
    STDOUT.puts( msg )
    @buf.puts( msg )
  end

  def print( msg )
    STDOUT.print( msg )
    @buf.print( msg )
  end

  def string  # returns underlying StringIO string
    @buf.string  
  end
    
end




class Time
  
  def self.cet( str )   # central european time (cet) + central european summer time (cest)  
    ActiveSupport::TimeZone['Vienna'].parse( str )
  end

  def self.eet( str )  # eastern european time (eet)  + 2 hours
    ActiveSupport::TimeZone['Bucharest'].parse( str )
  end
  
  def self.cst( str )  # central standard time (cst) - 6 hours 
    ActiveSupport::TimeZone['Mexico City'].parse( str )
  end
  
end # class Time


def markdown_to_html( content )
  Kramdown::Document.new( content ).to_html
end

