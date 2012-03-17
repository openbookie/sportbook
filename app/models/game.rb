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
#  score1        :integer
#  score2        :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  knockout      :boolean         default(FALSE)
#  score3        :integer
#  score4        :integer
#  score5        :integer
#  score6        :integer
#

class Game < ActiveRecord::Base

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :game_group

  def over?   # game over?
    play_at <= Time.now
  end
  
  def knockout?
    knockout == true
  end
  
  def complete?
    score1.present? && score2.present?
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
  
end # class Game
