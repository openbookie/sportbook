class GameGroupsController < ApplicationController

  # GET /groups
  def index
    @events = Event.all
  end

  # GET /groups/new
  def new
    @group = GameGroup.new
  end

  # POST /groups
  def create
    @group = GameGroup.new(params[:game_group])

    if @group.save
      redirect_to game_groups_path(), notice: 'Gruppe erfolgreich gespeichert.' 
    else
      render action: 'new'
    end
  end

  # GET /groups/1/edit
  def edit
    @group = GameGroup.find(params[:id])
  end

  # PUT /groups/1
  def update
    @group = GameGroup.find(params[:id])

    if @group.update_attributes(params[:game_group])
      redirect_to game_groups_path(), notice: 'Gruppe erfolgreich gespeichert.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /groups/1
  def destroy
    @group = GameGroup.find(params[:id])
    @group.destroy

    redirect_to game_groups_path()
  end

end # class GameGroupsController
