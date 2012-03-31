# encoding: utf-8

class TimeController < ApplicationController

  def index
    @items = Action.order( 'created_at desc' ).all
  end
    
end # class TimeController

