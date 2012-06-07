# encoding: utf-8

class SessionsController < ApplicationController
  
  # GET /session/new
  def new
    @user = User.new
  end

  # POST /session
  def create

    ## remove whitespace and (.-+_) and downcase
    email = params[:user][:email]
    if email.blank?
      key = 'xxx'
    else
      key = email.gsub( /[\s\.\-+_]/, '' ).downcase
    end
    
    @user = User.find_by_key( key )
    
    if @user.present? && @user.active? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Anmeldung erfolgreich.'
    
      # "force" change password for em2012 and tipp subdomains only
      if (params[:user][:password] == 'tipp' &&
          (request.host == 'em2012.herokuapp.com' ||
           request.host == 'tipp.herokuapp.com'))
        redirect_to new_password_path()
      else
        redirect_to pools_path()
      end
    else
      if @user.present?
        if @user.active == false
          flash.now[:error] = 'Konto gesperrt. Tut leid.'
        else
          flash.now[:error] = 'Falsches Passwort.'
        end
      else
        flash.now[:error] = 'Unbekannte Email. Tut leid.'
      end
      @user = User.new( params[:user] )
      render :action => 'new'
    end
  end
  
  
  # DELETE /session
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Tschüss.'
    redirect_to signin_path()
  end
end