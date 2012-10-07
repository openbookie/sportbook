# encoding: utf-8


## note :team3 => false   CL has no 3rd place (only final game)

Event.find_by_key!( 'cl' ).update_attributes!( :team3 => false )


Prop.create!( :key => 'db.cl.2011/12.2.version', :value => '1' )
