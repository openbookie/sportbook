# encoding: utf-8

class SessionsController < ApplicationController
  
  # GET /session/new
  def new
    @user = User.new
  end

  # POST /session
  def create
    @user = User.find_by_email( params[:user][:email])
    
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Anmeldung erfolgreich.'
    
      if params[:user][:password] == 'tipp'
        redirect_to new_password_path()
      else
        redirect_to pools_path()
      end
    else
      if @user.present?
        flash.now[:error] = 'Falsches Passwort.'
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