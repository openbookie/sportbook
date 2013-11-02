# encoding: utf-8

class TimeController < ApplicationController

  def index
    limit = params[:limit] || '100'
    
    ## all activities w/ users
    @items = Activity.where( 'user_id is not null').order( 'created_at desc' ).limit( limit )
  end

  def index2
    limit = params[:limit] || '100'
    
    ## all activities w/ no users
    @items = Activity.where( 'user_id is null').order( 'created_at desc' ).limit( limit )
  end

  def index3
    ## depreciated - remove after cleanup - use activities!!!
    limit = params[:limit] || '100'
    
    ## all actions w/ users
    @items = Action.where( 'user_id is not null').order( 'created_at desc' ).limit( limit )
  end

  def index4
    ## depreciated - remove after cleanup - use activities!!!
    limit = params[:limit] || '100'
    
    ## all actions w/ no users
    @items = Action.where( 'user_id is null').order( 'created_at desc' ).limit( limit )
  end
    
end # class TimeController

