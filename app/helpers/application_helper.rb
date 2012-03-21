# encoding: utf-8

module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Wettpool').join( ' ‹ ' )
      end
    end
  end

  def signed_in?
    session[:user_id].nil? == false
  end
  
  def current_user
    User.find( session[:user_id] )
  end
  
  def current_user?( user )
    session[:user_id] == user.id
  end
  
  def hl_style_for_user( user )  # css style to highlight current user
    if current_user?( user )
      ' highlight-me '
    else
      ''
    end
  end
  
  def fmt_date( date )
    if date.nil?
      '-'
    else
      date.strftime( "%a. %d. %b. / %H:%M" )
    end
  end

end
