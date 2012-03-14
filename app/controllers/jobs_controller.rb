class JobsController < ApplicationController
  
  
  def index
  end
  
  def calc
    txt = ">> Recalc Points:\r\n"
    
    Pool.all.each do |pool|
      txt << "=== #{pool.full_title} ===\r\n"
      pool.pool_users.each do |pool_user|
        pts = 0
        pool_user.tips.each do |tip|
          pts += tip.calc_points
        end
        pool_user.points = pts
        txt << "  #{pts} points -- #{pool_user.user.name}\r\n"
        pool_user.save!
      end  # each pool_user
    end  # each pool
    
    txt << "<< DONE"
    
    render :text => "<pre>#{txt}</pre>"
    # render :text => txt, :content_type => 'text/plain'
  end
  
end
