class Admin::ImportsController < Admin::BaseController
  
  # POST /import
  def create

    txt = ">> Import Backup Data (#{Time.now}):\r\n"

    import_backup_data( params[:data] )

    txt << ">> DONE (#{Time.now}) - #{Play.count} Plays, #{Tip.count} Tips."
    
    render :text => "<pre>#{txt}</pre>"

  end

end # class ImportsController