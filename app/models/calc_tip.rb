# == Schema Information
#
# Table name: tips
#
#  id            :integer         not null, primary key
#  user_id       :integer         not null
#  pool_id       :integer         not null
#  game_id       :integer         not null
#  score1        :integer
#  score2        :integer
#  score3        :integer
#  score4        :integer
#  score5        :integer
#  score6        :integer
#  toto12x       :string(255)
#  type          :string(255)
#  calc          :boolean         default(FALSE), not null
#  calc_team1_id :integer
#  calc_team2_id :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#


class CalcTip < Tip

  after_initialize :on_after_initialize

  belongs_to :calc_team1, :class_name => 'Team', :foreign_key => 'calc_team1_id'
  belongs_to :calc_team2, :class_name => 'Team', :foreign_key => 'calc_team2_id'

  ## note: use different calc forumula
  #  check for matching teams first
  #    before checking scoring

  def calc_points
    pts = 0

    ## step 1: teams must match for any points (scoring)
    
    if (complete? && 
        game.team1_id == calc_team1_id &&
        game.team2_id == calc_team2_id)
      
      if(((game.score1 == game.score2) && (score1 == score2)) ||
         ((game.score1 >  game.score2) && (score1 >  score2)) ||
         ((game.score1 <  game.score2) && (score1 <  score2)))
          pts += 1
      end

      # tordifferenz richtig? todo: auch fuer unentschieden???
      if((game.score1-game.score2) == (score1-score2))
        ## nb: for now now points for tordifferenz
        ### pts +=1
      end

      # ergebnis richtig?      
      if game.score1 == score1 && game.score2 == score2
        pts += 2
      end
    end
    pts
  end



private

  def on_after_initialize
    self.calc = true    # make sure calc flag is true
  end
  
end  # class CalcTip