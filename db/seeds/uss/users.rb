# encoding: utf-8

puts "*** loading seed data in seeds/uss/users.rb"

##############
##  Users

user1  = User.create!( :name => 'Behrooz SEIFI',      :email => 'behrooz',      :password => 'tipp', :admin => true )
user2  = User.create!( :name => 'Gerald BAUER',       :email => 'gerald',       :password => 'tipp', :admin => true )
user8  = User.create!( :name => 'Ande S.',            :email => 'ande',         :password => 'tipp', :admin => true )

user3  = User.create!( :name => 'Gürsel AYAZ',        :email => 'gürsel',       :password => 'tipp' )
user4  = User.create!( :name => 'Richard TRAINDL',    :email => 'richard',      :password => 'tipp' )
user5  = User.create!( :name => 'Manfred KOPECEK',    :email => 'manfred',      :password => 'tipp' )
user6  = User.create!( :name => 'Clemens HUBER',      :email => 'clemens',      :password => 'tipp' )
user7  = User.create!( :name => 'Franz BAUER',        :email => 'franz',        :password => 'tipp' )
user9  = User.create!( :name => 'Thomas SCHOLZ',      :email => 'thomas',       :password => 'tipp' )
user10 = User.create!( :name => 'Dietmar BAYERL',     :email => 'dietmar',      :password => 'tipp' )
user11 = User.create!( :name => 'Martina REININGER',  :email => 'martina',      :password => 'tipp' )
user12 = User.create!( :name => 'Andreas VANOREK',    :email => 'andy.vanorek', :password => 'tipp' )
user13 = User.create!( :name => 'Franz RUPF',         :email => 'franz.rupf',   :password => 'tipp' )
user14 = User.create!( :name => 'Stefan NEUBAUER',    :email => 'stefan',       :password => 'tipp' )
user15 = User.create!( :name => 'Andreas KLAAR',      :email => 'andy.klaar',   :password => 'tipp' )
user16 = User.create!( :name => 'Mike KOITZ',         :email => 'mike',         :password => 'tipp' )
user17 = User.create!( :name => 'Harry PIETSCHMANN',  :email => 'harry',        :password => 'tipp' )
user18 = User.create!( :name => 'Wolfgang SKALA',     :email => 'wolfgang',     :password => 'tipp' )
user19 = User.create!( :name => 'Dietmar PFUNDNER',   :email => 'didi',         :password => 'tipp' )
user20 = User.create!( :name => 'Christian S.',       :email => 'christian.s',  :password => 'tipp' )
user21 = User.create!( :name => 'Christian Z.',       :email => 'christian.z',  :password => 'tipp' )
user22 = User.create!( :name => 'Dimy M.',            :email => 'dimy',         :password => 'tipp' )
user23 = User.create!( :name => 'Claudia KOTZIAN',    :email => 'claudia',      :password => 'tipp' )
user24 = User.create!( :name => 'Markus BROSCH',      :email => 'markus',       :password => 'tipp' )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.users.version', :value => '1' )

