# encoding: utf-8

class PasswordsController < ApplicationController

  # GET /password/new
  def new
    @user = User.new
  end

  # POST /password
  def create
    @user = current_user()
    @user.password              = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
## todo: add check_password! to user model for checking password on save if flag set
    
    if @user.password.blank? && @user.password_confirmation.blank? 
      flash.now[:error] = 'Keine Eingabe. Neues Passwort leer.'
      render :action => 'new'
    elsif @user.save
      flash[:success] = 'Neues Passwort erfolgreich gespeichert.'
      redirect_to pools_path()
    else
      # @user = User.new( params[:user] )
      render :action => 'new'
    end
  end
  
  # DELETE /password (reset to default)
  def destroy
    ## todo
  end

end  # class PasswordsController