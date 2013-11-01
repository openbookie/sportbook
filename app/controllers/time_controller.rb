# encoding: utf-8

class TimeController < ApplicationController

  def index
    limit = params[:limit] || '100'
  end

  def index2
    limit = params[:limit] || '100'
    
    @items = Action.order( 'created_at desc' ).limit( limit )
  end
    
end # class TimeController

