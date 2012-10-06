# encoding: utf-8


## note :team3 => false   CL has no 3rd place (only final game)
##
## fix: team3 => false

# cl = Event.create!( :key => 'cl',
#                    :title => 'Champions League 2011/12',
#                    :team3 => false,
#                    :start_at => Time.cet( '2011-10-10 17:00' ) )


Prop.create!( :key => 'db.cl.2011/12.2.version', :value => '1' )
