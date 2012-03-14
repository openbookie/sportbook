class JobsController < ApplicationController
  
  
  def index
  end
  
  def calc
    txt = ">> Recalc Points:\r\n"
    
    Pool.all.each do |pool|
      txt << "=== #{pool.full_title} ===\r\n"
      pool.plays.each do |play|
        pts = 0
        play.tips.each do |tip|
          pts += tip.calc_points
        end
        play.points = pts
        txt << "  #{pts} points -- #{play.user.name}\r\n"
        play.save!
      end  # each play
    end  # each pool
    
    txt << "<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
    # render :text => txt, :content_type => 'text/plain'
  end
  
end
