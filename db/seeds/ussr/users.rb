# encoding: utf-8

puts "*** loading seed data in seeds/ussr/users.rb"

##############
#  Users

users = [
 [ 'Borovsky I', 'istvan' ], 
 [ 'Bozga M', 'marius' ], 
 [ 'Chindea S', 'simona' ],
 [ 'Cosma O', 'ovidiu' ],
 [ 'Costea N', 'nicoleta' ],
 [ 'Deac A', 'aurel', { :admin => true } ],
 [ 'Grebisan M', 'mihai' ],
 [ 'Isoc R', 'ramona' ],
 [ 'Oltean N', 'nicolae' ],
 [ 'Padurean R', 'razvan' ],
 [ 'Pal E', 'eniko' ],
 [ 'Petraru M', 'monica' ],
 [ 'Sinca R', 'raluca' ], 
 [ 'Sipos R', 'radu' ],
 [ 'Szasz I', 'ciobi', { :admin => true } ],
 [ 'Timoc V', 'virgil', { :admin => true } ]
]

User.create_from_ary!( users )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.ussr.users.version', :value => '1' )