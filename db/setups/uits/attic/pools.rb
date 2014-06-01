
world_quali_c  = Event.find_by_key!( 'world.quali.europe.c.2014' )

Pool.create!( event: world_quali_c,  title: 'UITS', user: behrooz, welcome: '' )


at_bl          = Event.find_by_key!( 'at.2013/14' )
at_cup         = Event.find_by_key!( 'at.cup.2013/14' )

cl             = Event.find_by_key!( 'cl.2013/14' )


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

Pool.create!( event: at_bl,          title: 'UITS', user: behrooz, welcome: at_bl_txt )
Pool.create!( event: at_cup,         title: 'UITS', user: behrooz, welcome: at_cup_txt )
Pool.create!( event: cl,             title: 'UITS', user: behrooz, welcome: '' )
