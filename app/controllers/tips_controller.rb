
## todo/fix:
#
#  move this code into game controller
# move current game controller to admin game controller


class TipsController < ApplicationController

  # GET /tips
  def index
    @game = Game.find( params[:game_id] )
  
    @complete_tips   = @game.tips.where( 'toto12x is not null' )
    @incomplete_tips = @game.tips.where( 'toto12x is null' )
    
    @tip_1_count = @complete_tips.where( :toto12x => '1' ).count()
    @tip_2_count = @complete_tips.where( :toto12x => '2' ).count()
    @tip_x_count = @complete_tips.where( :toto12x => 'X' ).count()

    @tip_12x_count = @tip_1_count + @tip_x_count + @tip_2_count
  end

  
end # class TipsController