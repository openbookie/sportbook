# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_euro.rb"

##############
##  Pools

euro    =  Event.find_by_key!( 'euro' )

nn =  User.find_by_key!( 'nn' )

pool1 = Pool.create!( :event => euro, :title => '(1) USS EF', :user => nn, :public => false, :fix => true,
                       :welcome => <<EOS )
Spielart Variante 1)  Man tippt vor Anpfiff alle Spiele bis zum Finale durch.

<!-- more -->

Punkte:

* Ein Punkt für den richtigen Tipp (1/X/2).
* Zwei Punkte für das richtige Ergebnis.
* Ein Punkt für die richtige Gruppenplatzierung.
* Ein Punkt bei richtigem Verlängerungstipp (1/X/2).
* Ein Punkt bei Elfmeter für den richtigen Tipp (1/2).
* Drei Punkte für den richtigen Europameister.
* Zwei Punkte für den richtigen Vizemeister.
EOS


pool2 = Pool.create!( :event => euro, :title => '(2) USS EF', :user => nn, :public => false,
                     :welcome => <<EOS )
Spielart Variante 2) Man tippt am Anfang den Europameister und Vizemeister und danach
__jedes Spiel spätestens am Spieltag bis 17 Uhr__.

<!-- more -->

Punkte:

* Ein Punkt für den richtigen Tipp (1/X/2).
* Zwei Punkte für das richtige Ergebnis.
* Ein Punkt bei richtigem Verlängerungstipp (1/X/2).
* Ein Punkt bei Elfmeter für den richtigen Tipp (1/2).
* Drei Punkte für den richtigen Europameister.
* Zwei Punkte für den richtigen Vizemeister.
EOS

pool1.players << nn   # also auto add admin as first player
pool2.players << nn


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.euro.version', :value => '1' )