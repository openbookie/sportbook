
class CalcGame < Game

  after_initialize :do_after_initialize

  def self.create_knockouts_from_ary!( games, round )
    CalcGame.create_from_ary!( games, round, true )
  end

  def self.create_from_ary!( games, round, knockout=false )
    games.each do |values|
      CalcGame.create!(
        :round     =>round,
        :pos       =>values[0],
        :team1     =>values[1],
        :score1    =>values[2][0],
        :score2    =>values[2][1],
        :score3    =>values[2][2],
        :score4    =>values[2][3],
        :score5    =>values[2][4],
        :score6    =>values[2][5],
        :team2     =>values[3],
        :play_at   =>values[4],
        :group     =>values[5],    # Note: group is optional (may be null/nil)
        :knockout  =>knockout )
    end # each games
  end



private

  def do_after_initialize
    self.calc = true    # make sure calc flag is true
  end
    
end  # class CalcGame