# encoding: utf-8


## note :team3 => false   CL has no 3rd place (only final game)

Event.find_by_key!( 'cl.2012/13' ).update_attributes!( :team3 => false )


Prop.create!( :key => 'db.cl.2012/13.2.version', :value => '1' )
