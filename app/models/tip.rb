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
  
  def self.find_by_user_and_pool_and_game( user_arg, pool_arg, game_arg )
    recs = self.where( :user_id => user_arg.id, :pool_id => pool_arg.id, :game_id => game_arg.id )
    recs.first
  end
    
  def calc_points
    pts = 0
    if complete?
      if((game.score1 == game.score2 && score1 == score2) ||
         (game.score1 >  game.score2 && score1 >  score2) ||
         (game.score2 <  game.score2 && score1 <  score2))
          pts += 1
      end

      if game.score1 == score1 && game.score2 == score2
        pts += 1
      end
      ## todo: add 1 point for guessing tordifferenz???
    end
    pts
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
  
  def bingo?
    return false unless complete?

    if((game.score1 == game.score2 && score1 == score2) ||
       (game.score1 >  game.score2 && score1 >  score2) ||
       (game.score2 <  game.score2 && score1 <  score2))
      true
    else
      false
    end
  end
    
end # class Tip