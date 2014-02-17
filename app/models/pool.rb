# == Schema Information
#
# Table name: pools
#
#  id           :integer         not null, primary key
#  event_id     :integer         not null
#  title        :string(255)     not null
#  user_id      :integer         not null
#  fix          :boolean         default(FALSE), not null
#  public       :boolean         default(TRUE), not null
#  locked       :boolean         default(FALSE), not null
#  welcome      :text
#  welcome_html :text
#  key          :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

module SportDb::Model

## NB: extend from sport.db-play gem


class Pool
  
  
  after_create :log_action_create
  
  before_save :on_before_save
  
  def on_before_save
    if welcome.blank?
      self.welcome_html = ''
    else
      self.welcome_html = markdown_to_html( welcome )
    end
  end
  
  def welcome_header_html
    return '' if welcome_html.blank?
    
    ## return everything up to (optional) <!-- more
    pos = welcome_html.index('<!-- more')
    if pos.nil?
      welcome_html
    else
      welcome_html[0...pos]  # NB: three point range (that is, ... => exlude the end value)
    end
  end
  
  ## todo/fix: can we use log_action_create! in filter??
  def log_action_create
    a = Action.new

    a.user_id = user_id
    a.pool_id = id
    a.tmpl    = 'pool-create'
    a.text    = "#{user.name} managt Wettpool >#{full_title}<. Mach mit! Tipp mit!"

    a.save!
  end
    
##  def full_title
##    "#{title} #{event.title}#{fix? ? ' Fix' : ''}"
##  end
  
  def fix?
    fix == true
  end
  
  def flex?
    fix != true
  end
  
  
end # class Pool

end  # module SportDb::Model

Pool = SportDb::Model::Pool
