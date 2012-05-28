
class Time
  
  def self.cet( str )   # central european time (cet) + central european summer time (cest)  
    ActiveSupport::TimeZone['Vienna'].parse( str )
  end
  
end # class Time


def markdown_to_html( content )
  Kramdown::Document.new( content ).to_html
end

