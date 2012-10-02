# encoding: utf-8

module PartHelper

  ###################################
  # helper for shared partials
  #
  # by convention all start w/ render_


  def render_game_date( game, opts={} )
    render :partial => 'shared/td_game_date', :locals => { :game => game }
  end

  def render_game_score( game, opts={} )
    render :partial => 'shared/td_game_score', :locals => { :game => game }
  end

  def render_game_team1( game, opts={} )
    render :partial => 'shared/td_game_team1', :locals => { :game => game }
  end

  def render_game_team2( game, opts={} )
    render :partial => 'shared/td_game_team2', :locals => { :game => game }
  end



  def render_tip_bingo( tip, opts={} )
    render :partial => 'shared/td_tip_bingo', :locals => { :tip  => tip }
  end

  def render_tip_score( tip, opts={} )
    render :partial => 'shared/td_tip_score', :locals => { :tip  => tip }
  end

  def render_tip_toto12x( tip, opts={} )
    render :partial => 'shared/td_tip_toto12x', :locals => { :tip  => tip }
  end

  def render_tip_score_input_for_form( tip, form, opts={} )
     tabindex = opts[:tabindex] ||= 1000
     
     render :partial => 'shared/td_tip_score_input',
            :locals  => { :tip      => tip,
                          :f        => form,
                          :tabindex => tabindex
                        }
  end


end # module PartHelper