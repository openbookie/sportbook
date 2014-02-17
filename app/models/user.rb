# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  email           :string(255)     not null
#  password_digest :string(255)
#  key             :string(255)     not null
#  admin           :boolean         default(FALSE), not null
#  guest           :boolean         default(FALSE), not null
#  active          :boolean         default(TRUE), not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

module SportDb
  module Model

## NB: extend from sport.db-play gem

class User
  
  has_many :actions
  
  has_secure_password   # use built-in rails macro for password to password_digest machinery

  before_save :on_before_save
  
  def on_before_save
    if email.blank?
      self.key = ''
    else
      ## remove whitespace and (.-+_) and downcase
      self.key = email.gsub( /[\s\.\-+_]/, '' ).downcase
    end
  end
  
  def self.create_from_ary!( users )
    users.each do |values|
      
      attr = {
        :name     => values[0],
        :email    => values[1],
        :password => 'tipp'
      }

      ## check for optional values
      opts = values[2] 
      if opts
        attr[ :admin ] = opts[ :admin ]  if opts.has_key?( :admin )
        attr[ :guest ] = opts[ :guest ]  if opts.has_key?( :guest )
      end
      
      User.create!( attr )
    end # each user
  end

end  # class User

  end # module Model
end  # module SportDb

User = SportDb::Model::User
