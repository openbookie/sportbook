
class Quote < ActiveRecord::Base
    
  belongs_to :service
  belongs_to :game
  
  def self.create_from_ary!( games_with_odds, service )
    games_with_odds.each do |values|
      Quote.create!(
        :service => service,
        :game    => values[0],
        :odds1   => values[1],
        :oddsx   => values[2],
        :odds2   => values[3])
    end # each games
  end

  def self.create_from_ary_for_round!( games_with_odds, service, round )
    games_with_odds.each do |values|
      Quote.create!(
        :service => service,
        :game    => Game.find_by_round_id_and_team1_id_and_team2_id!( round.id, values[0].id, values[1].id),
        :odds1   => values[2],
        :oddsx   => values[3],
        :odds2   => values[4])
    end # each games
  end

    
end  # class Quote