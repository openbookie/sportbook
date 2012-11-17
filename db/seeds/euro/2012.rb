# encoding: utf-8


euro = Event.find_euro_2012!


##############################################
##  Flex Only Rounds for **Flex** Style Pool

## fix/todo: update fix flag

# euro8 = Round.create!( :event => euro, :pos => 4, :title => 'Viertelfinale', :fix => false )
# euro4 = Round.create!( :event => euro, :pos => 5, :title => 'Halbfinale',    :fix => false )
# euro1 = Round.create!( :event => euro, :pos => 6, :title => 'Finale',        :fix => false )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.euro.2012.2.version', value: '1' )
