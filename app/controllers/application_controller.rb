class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include ApplicationHelper
  
  before_filter :set_locale
 
  def set_locale
    session[:locale] = I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    
    ## todo:
    ## use request.env['HTTP_ACCEPT_LANGUAGE'] to set default locale
    ##   on startup
    
  end
  
end # class ApplicationController
