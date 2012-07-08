class ProfilesController < ApplicationController
  
  # GET /profiles
  def index
    @users = User.all
  end
  
  # GET /profiles/:id
  def show
    @user = User.find( params[:id] )
  end
  
end # class ProfilesController