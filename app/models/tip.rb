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
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  score3     :integer
#  score4     :integer
#  score5     :integer
#  score6     :integer
#

class Tip < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pool
  belongs_to :game
  
  ## todo: rename to find_by_play_and_game ????
  def self.find_by_user_and_pool_and_game( user_arg, pool_arg, game_arg )
    recs = self.where( :user_id => user_arg.id, :pool_id => pool_arg.id, :game_id => game_arg.id )
    recs.first
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
    return '' if incomplete?
    
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

  def bingo_text
    return '' if incomplete?
    
    pts = calc_points()
    if pts == 0
       "#{game.toto12x} - Leider, nein."  # return 1,2,X from game
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
    
    
  def toto12x
    if score1.nil? || score2.nil?
      '-'
    elsif score1 == score2
      'X'
    elsif score1 > score2
      '1'
    elsif score1 < score2
      '2'
    end
  end

  def complete?
    game.score1.present? && game.score2.present? && score1.present? && score2.present?
  end
  
  def incomplete?
    complete? == false
  end
  
  def bingo?
    return false if incomplete?

    puts "#{game.score1} - #{game.score2}, #{score1} - #{score2}"
    
    if(((game.score1 == game.score2) && (score1 == score2)) ||
       ((game.score1 >  game.score2) && (score1 >  score2)) ||
       ((game.score1 <  game.score2) && (score1 <  score2)))
      puts "*** [debug] bingo true"
      true
    else
      puts "[debug] bingo false"
      false
    end
  end
  
  def score1_str
    if score1.blank? then '-' else score1.to_s end
  end

  def score2_str
    if score2.blank? then '-' else score2.to_s end
  end
    
end # class Tip