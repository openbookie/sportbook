# == Schema Information
#
# Table name: plays
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  pool_id    :integer         not null
#  team1_id   :integer
#  team2_id   :integer
#  team3_id   :integer
#  total_pts  :integer         default(0), not null
#  total_pos  :integer         default(0), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

module SportDb::Model
  
## NB: extend from sport.db-play gem


class Play
  
  
  after_create :log_action_create
  after_update :log_action_update

  def log_action_create
    a = Action.new

    a.user_id = user_id
    a.pool_id = pool_id
    a.tmpl    = 'play-create'
    a.text    = "#{user.name} tippt mit im Wettpool >#{pool.full_title}<. Willkommen!"

    a.save!
  end
    
  def log_action_update
    
    # only log if user action (not background job e.g. for update on total_pts)
    return if job_running?
    
    # only log if we got at least one team
    return if team1_id.blank? && team2_id.blank? && team3_id.blank?
    
    a = Action.new

    a.user_id = user_id
    a.pool_id = pool_id
    a.tmpl    = 'play-update'
    
    buf = ""
    buf << "#{user.name} tippt "
    buf << "1. Platz => #{team1.title} " if team1.present?
    buf << "2. Platz => #{team2.title} " if team2.present?
    buf << "3. Platz => #{team3.title} " if team3.present?
    buf << " im Wettpool >#{pool.full_title}<."
    
    a.text = buf
    a.save!
  end
    
end   # class Play

end # module SportDb::Model

Play = SportDb::Model::Play
