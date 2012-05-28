# encoding: utf-8

puts "*** loading seed data in seeds/uss/pools_euro.rb"

##############
##  Pools

euro    =  Event.find_by_key!( 'euro' )

behrooz =  User.find_by_email!( 'behrooz' )

pool1 = Pool.create!( :event => euro, :title => '(1) USS EF', :user => behrooz, :public => false, :fix => true,
                       :welcome => <<EOS )
Spielart Variante 1)  Man tippt vor Anpfiff alle Spiele bis zum Finale durch.
Ein Ausdruck ist bei Behrooz SEIFI
__spätestens am Do. 7. Juni 2012__ abzugeben (inkl. Teilnahmegebühr[^1]).

[^1]: Kinder ausgenommen.

<!-- more -->

Punkte:

* Ein Punkt für den richtigen Tipp (1/X/2).
* Zwei Punkte für das richtige Ergebnis.
* Ein Punkt für die richtige Gruppenplatzierung.
* Ein Punkt bei richtigem Verlängerungstipp (1/X/2).
* Ein Punkt bei Elfmeter für den richtigen Tipp (1/2).
* Drei Punkte für den richtigen Europameister.
* Zwei Punkte für den richtigen Vizemeister.

Alle Tipps und die Auswertungen werden ab Do. 7. Juni Nachmittag freigeschaltet.
EOS


pool2 = Pool.create!( :event => euro, :title => '(2) USS EF', :user => behrooz, :public => false,
                     :welcome => <<EOS )
Spielart Variante 2) Man tippt am Anfang den Europameister und Vizemeister und danach
__jedes Spiel spätestens am Spieltag bis 17 Uhr__[^1].

[^1]: Teilnahme nur möglich, wenn man in der Variante 1 mitmacht.

<!-- more -->


Punkte:

* Ein Punkt für den richtigen Tipp (1/X/2).
* Zwei Punkte für das richtige Ergebnis.
* Ein Punkt bei richtigem Verlängerungstipp (1/X/2).
* Ein Punkt bei Elfmeter für den richtigen Tipp (1/2).
* Drei Punkte für den richtigen Europameister.
* Zwei Punkte für den richtigen Vizemeister.
EOS

pool1.players << behrooz   # also auto add admin as first player
pool2.players << behrooz


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.uss.pools.euro.version', :value => '1' )