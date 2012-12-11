# encoding: utf-8

##############
##  Pools

at_bl         = Event.find_at_2012_13!
at_cup        = Event.find_at_cup_2012_13!
cl            = Event.find_cl_2012_13!
world_quali   = Event.find_by_key!( 'world.quali.euro.2012/13' )

nn =  User.find_by_key!( 'nn' )

behrooz = User.find_by_key!( 'behroozs' )
manfred = User.find_by_key!( 'manfredk' )
ande    = User.find_by_key!( 'ande' )

at_bl_txt = <<EOS
<!-- more -->

Punkte:

* Ein Punkt für den richtigen Tipp (1/X/2).
* Zwei Punkte extra für das richtige Ergebnis (d.h. 3=2+1). NB: Ab 4 Toren gilt die 4+ Regel.

Bonuspunkte: 

* Zehn Punkte für den richtigen Meister.
* Sieben Punkte für den richtigen Vizemeister.
* Fünf Punkte für den richtigen Drittplazierten.
* Ein Punkt pro richtigen Endplazierten (1., 2. oder 3.)

Hinweis: Bonuspunkte Änderung noch möglich. 
EOS

at_cup_txt = <<EOS
<!-- more -->

Punkte:

* Ein Punkt für den richtigen Tipp nach 90 Minuten (1/X/2).
* Zwei Punkte extra für das richtige Ergebnis nach 90 Minuten (d.h. 3=2+1). NB: Ab 4 Toren gilt die 4+ Regel.
* Ein Punkt extra bei Verlängerung für den richtigen Tipp (1/X/2).
* Ein Punkt extra bei Elfmeter für den richtigen Tipp (1/2).

Bonuspunkte: 

* Fünf Punkte für den richtigen Cupsieger.
* Drei Punkte für den richtigen Zweitplazierten.
* Ein Punkt pro richtigen Endplazierten (1., 2.)

Hinweis: Bonuspunkte Änderung noch möglich.
EOS

Pool.create!( event: at_bl,        title: 'USS', user: manfred, welcome: at_bl_txt )
Pool.create!( event: at_cup,       title: 'USS', user: manfred, welcome: at_cup_txt )
Pool.create!( event: world_quali,  title: 'USS', user: behrooz, welcome: '' )
Pool.create!( event: cl,           title: 'USS', user: ande,    welcome: '' )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( key: 'db.uss.pools.others.version', value: '1' )
