# encoding: utf-8

module ApplicationHelper

  def powered_by
    ## todo/fix: use version from wettpool module
    content_tag :div do
      link_to( 'Sportbook/1', 'https://github.com/geraldb/sportbook' ) + ', ' +
      link_to( "sport.db/#{SportDB::VERSION}", 'https://github.com/geraldb/sport.db' ) + ', ' +
      link_to( "sport.db-market/#{SportDB::Market::VERSION}", 'https://github.com/geraldb/sport.db-market' ) + ', ' +
      link_to( "world.db/#{WorldDB::VERSION}", 'https://github.com/geraldb/world.db' ) + ' - ' +
      content_tag( :span, "Ruby/#{RUBY_VERSION} (#{RUBY_RELEASE_DATE}/#{RUBY_PLATFORM}) on") + ' ' +
      content_tag( :span, "Rails/#{Rails.version} (#{Rails.env})" )
      ## content_tag( :span, "#{request.headers['SERVER_SOFTWARE'] || request.headers['SERVER']}" )
    end
  end

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Sportbook').join( ' ‹ ' )
      end
    end
  end
  
  # todo/fix: try/polish breadcrumb helper
  def breadcrumb(*parts)
    content_for :breadcrumb do
      parts.join( ' › ' )
    end
  end

  def signed_in?
    session[:user_id].nil? == false
  end
  
  def current_user
    User.find( session[:user_id] )
  end
  
  def current_user_id
    session[:user_id]
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


end
