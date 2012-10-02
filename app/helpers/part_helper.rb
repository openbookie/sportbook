# encoding: utf-8

module PartHelper

  ###################################
  # helper for shared partials
  #
  # by convention all start w/ render_


  def render_event_quotes( event, opts={} )
    render :partial => 'shared/table_event_quotes', :locals => { :event => event }
  end


  def render_play_teams( play, opts={} )
    render :partial => 'shared/table_play_teams',
           :locals => { :play => play,
                        :pool => play.pool
                      }
  end

  def render_play_teams_for_form( play, form, opts={} )
    
    render :partial => 'shared/table_play_teams_input',
           :locals => { :play  => play,
                        :f     => form,
                        :event => play.pool.event,
                        :pool  => play.pool
                      }
  end


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
  
  def render_game_quotes( game, opts={} )
    render :partial => 'shared/table_game_quotes', :locals => { :game => game }
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