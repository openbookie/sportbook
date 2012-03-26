# == Schema Information
#
# Table name: games
#
#  id            :integer         not null, primary key
#  game_group_id :integer         not null
#  pos           :integer         not null
#  team1_id      :integer         not null
#  team2_id      :integer         not null
#  play_at       :datetime        not null
#  knockout      :boolean         default(FALSE), not null
#  score1        :integer
#  score2        :integer
#  score3        :integer
#  score4        :integer
#  score5        :integer
#  score6        :integer
#  next_game_id  :integer
#  prev_game_id  :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Game < ActiveRecord::Base

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  
  belongs_to :round

  has_many   :tips

  before_save :calc_toto12x

  def self.create_knockouts_from_ary!( games, round )
    Game.create_from_ary!( games, round, true )
  end

  def self.create_from_ary!( games, round, knockout=false )
    games.each do |values|
      Game.create!(
        :round     =>round,
        :pos       =>values[0],
        :team1     =>values[1],
        :score1    =>values[2],
        :score2    =>values[3],
        :team2     =>values[4],
        :play_at   =>values[5],
        :knockout  =>knockout )
    end # each games
  end

  def self.create_knockout_pairs_from_ary!( pairs, round1, round2 )
    
    pairs.each do |pair|
      game1_attribs = {
        :round     =>round1,
        :pos       =>pair[0][0],
        :team1     =>pair[0][1],
        :score1    =>pair[0][2],
        :score2    =>pair[0][3],
        :team2     =>pair[0][4],
        :play_at   =>pair[0][5] }

      game2_attribs = {
        :round     =>round2,
        :pos       =>pair[1][0],
        :team1     =>pair[1][1],
        :score1    =>pair[1][2],
        :score2    =>pair[1][3],
        :team2     =>pair[1][4],
        :play_at   =>pair[1][5],
        :knockout  =>true }
  
      game1 = Game.create!( game1_attribs )
      game2 = Game.create!( game2_attribs )

      # linkup games
      game1.next_game_id = game2.id
      game1.save!
  
      game2.prev_game_id = game1.id
      game2.save!
    end # each pair
  end
   
  def over?   # game over?
    play_at <= Time.now
  end
  
  def knockout?
    knockout == true
  end
  
  def complete?
    score1.present? && score2.present?
  end
  
  def score_str
    "#{score1_str} : #{score2_str}"
  end
  
  def score1_str
    if score1.blank? then '-' else score1.to_s end
  end

  def score2_str
    if score2.blank? then '-' else score2.to_s end
  end

  def team1_style_class
    buf = ''
    buf << 'game-team-calc '    if team1.calc? 
    buf << 'game-team-winner '  if complete? && (score1 >  score2)
    buf << 'game-team-draw '    if complete? && (score1 == score2)
    buf
  end
  
  def team2_style_class
    buf = ''
    buf << 'game-team-calc '    if team2.calc? 
    buf << 'game-team-winner '  if complete? && (score2 >  score1)
    buf << 'game-team-draw '    if complete? && (score2 == score1)
    buf
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
  
  def tip_1_style_class
    toto12x == '1' ? ' bingo ' : ' '
  end
  
  def tip_2_style_class
    toto12x == '2' ? ' bingo ' : ' '
  end
  
  def tip_x_style_class
    toto12x == 'X' ? ' bingo ' : ' '
  end
  
  
  def play_at_str
    play_at.strftime( "%a. %d. %b. / %H:%M" )
  end
  
  ############ some methods for stats
  
  def complete_tips
    tips.where( 'toto12x is not null' )
  end

  def complete_tips_1
    tips.where( 'toto12x is not null' ).where( :toto12x => '1' ).order( 'score1 desc,score2 desc')
  end

  def complete_tips_2
    tips.where( 'toto12x is not null' ).where( :toto12x => '2' ).order( 'score2 desc,score1 desc')
  end
  
  def complete_tips_x
    tips.where( 'toto12x is not null' ).where( :toto12x => 'X' ).order( 'score1 desc,score2 desc')
  end
  
  
  def incomplete_tips
    tips.where( 'toto12x is null' )
  end
  
  def tip_1_count
    complete_tips.where( :toto12x => '1' ).count()
  end
  
  def tip_2_count
    complete_tips.where( :toto12x => '2' ).count()
  end
  
  def tip_x_count
    complete_tips.where( :toto12x => 'X' ).count()
  end
  
  def tip_12x_count
    complete_tips.count()
  end

end # class Game
