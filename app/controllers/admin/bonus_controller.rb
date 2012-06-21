class Admin::BonusController < Admin::BaseController

  def index
    @pools = Pool.all
  end
  
  def update
    # mass update of bonus tips 
     
    # check for case w/ no games
    if params[:tips]
     
      pp params[:tips]
     
      params[:tips].each do |tip_id,tip_hash|
        tip = BonusTip.find( tip_id )
      
        # only update if has changes (to avoid duplicate/false action item in news feed)
      
        pts = tip_hash[:pts].blank? ? 0 : tip_hash[:pts].to_i
      
        if tip.pts != pts
          logger.info "*** updating bonus tip #{tip_id} (pts: #{pts})"

          tip.pts = pts
          tip.save!
        else
          logger.info "*** skip updating bonus tip #{tip_id} - no changes"
        end
      end # each tip
      flash[:success] = 'Bonuspunkte erfolgreich gespeichert.'
    end  # tips.present?
  
    redirect_to admin_bonus_path()
  end

end # class BonusController