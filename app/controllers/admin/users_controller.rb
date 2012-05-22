class Admin::UsersController < Admin::BaseController

  # GET /users
  def index
    @users = User.all
  end

 # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    @user.password = 'tipp'   # default password change later

    if @user.save
      redirect_to users_path(), notice: 'Benutzer erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path(), notice: 'Benutzer erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path() 
  end
  
end # class UsersController