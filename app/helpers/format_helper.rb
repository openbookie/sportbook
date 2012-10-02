# encoding: utf-8

module FormatHelper

  def fmt_quote( num )
    if num >= 10
      "%3.0f" % num
    else
      "%3.2f" % num
    end
  end
  
  def fmt_date( date )
    if date.nil?
      '-'
    else
      date.strftime( "%a. %d. %b. / %H:%M" )
    end
  end

end # module FormatHelper