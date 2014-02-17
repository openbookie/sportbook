# encoding: utf-8

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

module SportDb
  module Model

## NB: extend from sport.db-play gem

class Tip 

  before_save  :log_activity


  def log_activity
    # add news feed item after save

    # only log if any changes  - redundant ?? e.g. callback gets anyway only called if any changes present in the first place?? check
    return unless changed?

    # only log complete tips
    return if winner90.nil?

    a = Activity.new
    a.user_id = user_id
    a.trackable_type = self.class.name
    a.trackable_id   = id
    a.tmpl    = 'tip'

    a.action  = new_record?  ? 'create' : 'update'

    a.text    = "#{user.name} tippt [#{toto12x}] #{game.team1.title} #{score_str} #{game.team2.title} (#{game.round.title}) im Wettpool >#{pool.full_title}<."

    a.save!
  end


  def public_user_name_str()   public? ? user.name : 'Anonymous';  end
  def public_score_str()       public? ? score_str : '# : #';      end
  def public_toto1x2_str()     public? ? toto12x : '#';            end
  def public_toto12x_str()     public_toto1x2_str;    end    # alias for public_toto1x2_str


end # class Tip

  end # module Model
end  # module SportDb

Tip = SportDb::Model::Tip
