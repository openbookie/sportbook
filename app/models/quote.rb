
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
  
    
end  # class Quote