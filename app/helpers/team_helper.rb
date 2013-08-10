# encoding: utf-8

module TeamHelper

  def logo_for_team( team )
    # 1) check if logo exists    
    if Rails.application.assets.find_asset( "logos/24x24/#{team.key}.png" ).present?
      image_tag( "logos/24x24/#{team.key}.png" )
    else
      ''  # return empty string (e.g. nothing)
    end
  end

end # module TeamHelper