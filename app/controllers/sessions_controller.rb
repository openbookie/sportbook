# encoding: utf-8

class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email( params[:user][:email])
    
    if @user.nil?
      flash.now[:error] = 'Unbekannte Email. Sorry.'
      @user = User.new( params[:user] )      
      render :action => 'new'
    else
      session[:user_id] = @user.id   
    
      flash[:notice] = 'Anmeldung erfolgreich.'
      redirect_to pools_path      
    end    
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Tschüss'
    redirect_to signin_path
  end
end
