# encoding: utf-8

module ApplicationHelper

  def powered_by
    ## todo/fix: use version from wettpool module
    content_tag :div do
      link_to( 'Sportbook/1', 'https://github.com/openbookie/sportbook' ) + ', ' +
      link_to( "sport.db.play/#{SportDb::Play::VERSION}", 'https://github.com/openbookie/sport.db.play' ) + ', ' +
      link_to( "sport.db.market/#{SportDb::Market::VERSION}", 'https://github.com/openbookie/sport.db.market' ) + ', ' +
      link_to( "sport.db/#{SportDb::VERSION}", 'https://github.com/sportdb/sport.db.ruby' ) + ', ' +
      link_to( "sport.db.admin/#{SportDbAdmin::VERSION}", 'https://github.com/sportdb/sport.db.admin' ) + ', ' +
      link_to( "world.db/#{WorldDb::VERSION}", 'https://github.com/worlddb/world.db.ruby' ) + ', ' +
      link_to( "world.db.admin/#{WorldDbAdmin::VERSION}", 'https://github.com/worlddb/world.db.admin' ) + ' - ' +
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


  ### move to helpers session_helper  or auth_helper or login_helper ??

  def signed_in?
    session[:user_id].nil? == false
  end

  def current_user
    ### fix: return a "guest" user if not signed in - do NOT return nil!!
    ## cache current_user lookup result  e.g. current_user_cache ||=   why? why not?
    User.find( session[:user_id] )
  end

  def current_user_id
    session[:user_id]
  end

  def current_user?( user )
    ## check for nil user
    if user.nil?
      # no user passed in (passed in nil - issue/log warning ??)
      false
    else
      session[:user_id] == user.id
    end
  end

  def hl_style_for_user( user )  # css style to highlight current user
    if user.nil?   # note: check for valid user passed in (not nil)
      ''  # no user passed in (passed in nil - issue/log warning ??) 
    elsif current_user?( user )   
      ' highlight-me '
    else
      ''
    end
  end


end
