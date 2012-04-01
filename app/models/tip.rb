# encoding: utf-8

# == Schema Information
#
# Table name: tips
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  pool_id    :integer         not null
#  game_id    :integer         not null
#  score1     :integer
#  score2     :integer
#  score3     :integer
#  score4     :integer
#  score5     :integer
#  score6     :integer
#  toto12x    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Tip < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  belongs_to :game

  before_save :calc_toto12x
  after_save  :log_action

  
  ## todo: rename to find_by_play_and_game ????
  def self.find_by_user_and_pool_and_game( user_arg, pool_arg, game_arg )
    recs = self.where( :user_id => user_arg.id, :pool_id => pool_arg.id, :game_id => game_arg.id )
    recs.first
  end
    
    
  def log_action
    # add news feed item after save
    
    # only log complete tips
    return if toto12x.nil?
    
    a = Action.new

    ## todo: add pool_id
    a.user_id = user_id
    a.tip_id  = id
    a.tmpl    = 'tip'
    a.text    = "#{user.name} tippt [#{toto12x}] #{game.team1.title} #{score1}:#{score2} #{game.team2.title} im Wettpool >#{pool.full_title}<."

    a.save!
  end
    
    
    
  def export?
    # check if user entered some data
    # - do NOT export nil records (all scores blank)
    
    (score1.blank? && score2.blank? && score3.blank? && score4.blank? && score5.blank? && score6.blank?)==false
  end
    
  def calc_points
    pts = 0
    if complete?
      if(((game.score1 == game.score2) && (score1 == score2)) ||
         ((game.score1 >  game.score2) && (score1 >  score2)) ||
         ((game.score1 <  game.score2) && (score1 <  score2)))
          pts += 1
      end

      # tordifferenz richtig? todo: auch fuer unentschieden???
      if((game.score1-game.score2) == (score1-score2))
        pts +=1
      end

      # ergebnis richtig?      
      if game.score1 == score1 && game.score2 == score2
        pts += 1
      end
    end
    pts
  end
  
  ## todo: use tip-fail, tip-bingo, etc.
  
  def bingo_style_class
    if incomplete?
      # show missing label for upcoming games only
      if game.over?
        ''
      elsif score1.blank? || score2.blank?
        'missing'  # missing tip scores
      else
        ''  # tip scores filled in; game scores not yet available
      end
    else
      pts = calc_points()
      if pts == 0
        'fail'
      elsif pts == 1
        'bingo'
      elsif pts == 2
        'bingoo'
      elsif pts == 3
        'bingooo'
      else
        ''  # unknown state; return empty (css) class
      end
    end
  end

  def bingo_text
    if incomplete?
      # show missing label for upcoming games only
      if game.over?
        ''
      elsif score1.blank? || score2.blank?
        '?'  # missing tip scores
      else
        ''  # tip scores filled in; game scores not yet available
      end
    else
      pts = calc_points()
      if pts == 0
        "Leider, nein. Richtig Tipp #{game.toto12x}."  # return 1,2,X from game
      elsif pts == 1
        'Ja!'
      elsif pts == 2
        'Jaaa!'
      elsif pts == 3
        'Jaaaaa!'
      else
        ''  # unknown state; return empty (css) class
      end
    end
  end
    
  def calc_toto12x
    if score1.nil? || score2.nil?
      self.toto12x = nil
    elsif score1 == score2
      self.toto12x = 'X'
    elsif score1 > score2
      self.toto12x = '1'
    elsif score1 < score2
      self.toto12x = '2'
    end
  end
  

  def complete?
    game.score1.present? && game.score2.present? && score1.present? && score2.present?
  end
  
  def incomplete?
    complete? == false
  end


  
  def score_str
    if score1.blank? && score2.blank? && game.over?
      # return no data marker (e.g. middot) if not touched by user
      '·'
    else
      "#{score1_str} : #{score2_str}"
    end
  end
  
  def score1_str
    if score1.blank? then '?' else score1.to_s end
  end

  def score2_str
    if score2.blank? then '?' else score2.to_s end
  end

end # class Tip
