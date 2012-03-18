# encoding: utf-8

class PagesController < ApplicationController

  def about
  end
  
  def home
    if signed_in?
      redirect_to pools_path()
    else
      redirect_to signin_path()
    end
  end
  
end # class PagesController


