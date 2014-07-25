# encoding: utf-8

module PartHelper

  ###################################
  # helper for shared partials
  #
  # by convention all start w/ render_


  def render_event_quotes( event, opts={} )
    render partial: 'shared/table_event_quotes', locals: { event: event }
  end


  def render_play_teams( play, opts={} )
    render partial: 'shared/table_play_teams',
           locals: { play: play,
                     pool: play.pool
                   }
  end

  def render_play_team1( play, opts={} )
    render partial: 'shared/td_play_team1', locals: { play: play }
  end

  def render_play_team2( play, opts={} )
    render partial: 'shared/td_play_team2', locals: { play: play }
  end

  def render_play_team3( play, opts={} )
    render partial: 'shared/td_play_team3', locals: { play: play }
  end

  def render_play_teams_for_form( play, form, opts={} )
    
    render partial: 'shared/table_play_teams_input',
           locals:  { play:  play,
                      f:     form,
                      event: play.pool.event,
                      pool:  play.pool
                    }
  end


  def render_game_date( game, opts={} )
    render partial: 'shared/td_game_date', locals: { game: game }
  end

  def render_game_toto12x( game, opts={} )
    render partial: 'shared/td_game_toto12x', locals: { game: game }
  end

  def render_game_score( game, opts={} )
    render partial: 'shared/td_game_score', locals: { game: game }
  end

  def render_game_team1( game, opts={} )
    render partial: 'shared/td_game_team1', locals: { game: game }
  end

  def render_game_team1_v2( game, opts={} )
    ### fix/todo: add check for :link opt
    render partial: 'shared/td_game_team1_v2', locals: { game: game }
  end

  def render_game_team2( game, opts={} )
    render partial: 'shared/td_game_team2', locals: { game: game }
  end

  def render_game_team2_v2( game, opts={} )
    ### fix/todo: add check for :link opt
    render partial: 'shared/td_game_team2_v2', locals: { game: game }
  end
  
  def render_game_quotes( game, opts={} )
    render partial: 'shared/table_game_quotes', locals: { game: game }
  end



  def render_tip_bingo( tip, opts={} )
    render partial: 'shared/td_tip_bingo', locals: { tip: tip }
  end

  def render_tip_score( tip, opts={} )
    render partial: 'shared/td_tip_score', locals: { tip: tip }
  end
  
  def render_tip_score_v2( tip, opts={} )
    show_tips = opts[:show_tips].present? ? opts[:show_tips] : true  # default true
    show_pts  = opts[:show_pts].present? ? opts[:show_pts] : false  # default false

    ## todo/fix: how to deal w/ missing tip - tip.nil?    
    
    render partial: 'shared/td_tip_score_v2',
           locals: { tip:       tip,
                     game:     (tip.present? ? tip.game : nil),
                     show_tips: show_tips,
                     show_pts:  show_pts
                   }
  end
  
  def render_tip_toto12x( tip, opts={} )
    render partial: 'shared/td_tip_toto12x', locals: { tip: tip }
  end


  def render_tip_score_input_for_form( tip, form, opts={} )
     tabindex = opts[:tabindex] || 1000
     
     ### hack: for recalc groups (add "hidden" inputs using display none)
     hidden   = opts[:hidden].nil? ? false : opts[:hidden]   # defaults to NOT hidden 

     render partial: 'shared/td_tip_score_input',
            locals: { tip:      tip,
                      f:        form,
                      tabindex: tabindex,
                      hidden:   hidden
                    }
  end


end # module PartHelper
