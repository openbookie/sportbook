# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/cl/cl_2012_13.rb"

#################################
## Champions League 2012/13

## note :team3 => false   CL has no 3rd place (only final game)
cl = Event.create!( :key => 'cl.2012/13',
                    :title => 'Champions League 2012/13',
                    :team3 => false,
                    :start_at => Time.cet( '2012-09-18 18:30' ) )

porto         = Team.find_by_key!( 'porto' )
kiew          = Team.find_by_key!( 'kiew' )
paris         = Team.find_by_key!( 'paris' )
zagreb        = Team.find_by_key!( 'zagreb' )

arsenal       = Team.find_by_key!( 'arsenal' )
schalke       = Team.find_by_key!( 'schalke' )
olympiacos    = Team.find_by_key!( 'olympiacos' )
montpellier   = Team.find_by_key!( 'montpellier' )

milan         = Team.find_by_key!( 'milan' )
zenit         = Team.find_by_key!( 'zenit' )
anderlecht    = Team.find_by_key!( 'anderlecht' )
malaga        = Team.find_by_key!( 'malaga' )

madrid        = Team.find_by_key!( 'madrid' )
mancity       = Team.find_by_key!( 'mancity' )
ajax          = Team.find_by_key!( 'ajax' )
dortmund      = Team.find_by_key!( 'dortmund' )

chelsea       = Team.find_by_key!( 'chelsea' )
donezk        = Team.find_by_key!( 'donezk' )
juventus      = Team.find_by_key!( 'juventus' )
nordsjalland  = Team.find_by_key!( 'nordsjalland' )

bayern        = Team.find_by_key!( 'bayern' )
valencia      = Team.find_by_key!( 'valencia' )
lille         = Team.find_by_key!( 'lille' )
borissow      = Team.find_by_key!( 'borissow' )

barcelona     = Team.find_by_key!( 'barcelona' )
benfica       = Team.find_by_key!( 'benfica' )
spartak       = Team.find_by_key!( 'spartak' )
celtic        = Team.find_by_key!( 'celtic' )

manunited     = Team.find_by_key!( 'manunited' )
braga         = Team.find_by_key!( 'braga' )
galatasaray   = Team.find_by_key!( 'galatasaray' )
cluj          = Team.find_by_key!( 'cluj' )



cl.teams << porto
cl.teams << kiew
cl.teams << paris
cl.teams << zagreb

cl.teams << arsenal
cl.teams << schalke
cl.teams << olympiacos
cl.teams << montpellier

cl.teams << milan
cl.teams << zenit
cl.teams << anderlecht
cl.teams << malaga

cl.teams << madrid
cl.teams << mancity
cl.teams << ajax
cl.teams << dortmund

cl.teams << chelsea
cl.teams << donezk
cl.teams << juventus
cl.teams << nordsjalland

cl.teams << bayern
cl.teams << valencia
cl.teams << lille
cl.teams << borissow

cl.teams << barcelona
cl.teams << benfica
cl.teams << spartak
cl.teams << celtic

cl.teams << manunited
cl.teams << braga
cl.teams << galatasaray
cl.teams << cluj


cla = Group.create!( :event => cl, :pos => 1, :title => 'Gruppe A' )
clb = Group.create!( :event => cl, :pos => 2, :title => 'Gruppe B' )
clc = Group.create!( :event => cl, :pos => 3, :title => 'Gruppe C' )
cld = Group.create!( :event => cl, :pos => 4, :title => 'Gruppe D' )
cle = Group.create!( :event => cl, :pos => 5, :title => 'Gruppe E' )
clf = Group.create!( :event => cl, :pos => 6, :title => 'Gruppe F' )
clg = Group.create!( :event => cl, :pos => 7, :title => 'Gruppe G' )
clh = Group.create!( :event => cl, :pos => 8, :title => 'Gruppe H' )

#################################
# Gruppe A

cla.teams << porto
cla.teams << kiew
cla.teams << paris
cla.teams << zagreb


#################################
# Gruppe B

clb.teams << arsenal
clb.teams << schalke
clb.teams << olympiacos
clb.teams << montpellier


#################################
# Gruppe C

clc.teams << milan
clc.teams << zenit
clc.teams << anderlecht
clc.teams << malaga

#################################
# Gruppe D

cld.teams << madrid
cld.teams << mancity
cld.teams << ajax
cld.teams << dortmund


#################################
# Gruppe E

cle.teams << chelsea
cle.teams << donezk
cle.teams << juventus
cle.teams << nordsjalland


#################################
# Gruppe F

clf.teams << bayern
clf.teams << valencia
clf.teams << lille
clf.teams << borissow


#################################
# Gruppe G

clg.teams << barcelona
clg.teams << benfica
clg.teams << spartak
clg.teams << celtic


#################################
# Gruppe H

clh.teams << manunited
clh.teams << braga
clh.teams << galatasaray
clh.teams << cluj


clr1   = Round.create!( :event => cl, :pos => 1, :title => 'Spieltag 1', :title2 => 'Di./Mi., 18.+19. Sep 2012' )
clr2   = Round.create!( :event => cl, :pos => 2, :title => 'Spieltag 2', :title2 => 'Di./Mi., 2.+3. Okt 2012' )
clr3   = Round.create!( :event => cl, :pos => 3, :title => 'Spieltag 3', :title2 => 'Di./Mi., 23.+24. Okt 2012' )
clr4   = Round.create!( :event => cl, :pos => 4, :title => 'Spieltag 4', :title2 => 'Di./Mi., 6.+7. Nov 2012' )
clr5   = Round.create!( :event => cl, :pos => 5, :title => 'Spieltag 5', :title2 => 'Di./Mi., 20.+21. Nov 2012' )
clr6   = Round.create!( :event => cl, :pos => 6, :title => 'Spieltag 6', :title2 => 'Di./Mi., 4.+5. Dez 2012' )

cl16   = Round.create!( :event => cl, :pos => 7, :title => 'Achtelfinale', :title2 => 'Di./Mi., 12.+13./19.+20. Feb 2013' )
cl16_2 = Round.create!( :event => cl, :pos => 8, :title => 'Achtelfinale Rückspiele', :title2 => 'Di./Mi., 5.+6./12.+13. Mär 2013' )
cl8    = Round.create!( :event => cl, :pos => 9, :title => 'Viertelfinale',            :title2 => 'Di./Mi., 2.+3. Apr 2013' )
cl8_2  = Round.create!( :event => cl, :pos => 10, :title => 'Viertelfinale Rückspiele', :title2 => 'Di./Mi., 9.+10. Apr 2013' )
cl4    = Round.create!( :event => cl, :pos => 11, :title => 'Halbfinale',               :title2 => 'Di./Mi., 23.+24. Apr 2013' )
cl4_2  = Round.create!( :event => cl, :pos => 12, :title => 'Halbfinale Rückspiele',    :title2 => 'Di./Mi., 30. Apr/1. Mai 2013' )
cl1    = Round.create!( :event => cl, :pos => 13, :title => 'Finale',                   :title2 => 'Sa. 25. Mai 2013' )


games_cla = [
  [[ 1, zagreb, [], porto,  Time.cet('2012-09-18 20:45'), clr1 ],
   [ 2, porto,  [], zagreb, Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 2, paris,  [], kiew,   Time.cet('2012-09-18 20:45'), clr1 ],
   [ 1, kiew,   [], paris,  Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 1, kiew,   [], zagreb, Time.cet('2012-10-03 20:45'), clr2 ],
   [ 2, zagreb, [], kiew,   Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 2, porto,  [], paris,  Time.cet('2012-10-03 20:45'), clr2 ],
   [ 1, paris,  [], porto,  Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 1, porto,  [], kiew,   Time.cet('2012-10-24 20:45'), clr3 ],
   [ 1, kiew,   [], porto,  Time.cet('2012-11-06 20:45'), clr4 ]],
  [[ 2, zagreb, [], paris,  Time.cet('2012-10-24 20:45'), clr3 ],
   [ 2, paris,  [], zagreb, Time.cet('2012-11-06 20:45'), clr4 ]]
]

games_clb = [
  [[ 3, montpellier, [], arsenal,     Time.cet('2012-09-18 20:45'), clr1 ],
   [ 4, arsenal,     [], montpellier, Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 4, olympiacos,  [], schalke,     Time.cet('2012-09-18 20:45'), clr1 ],
   [ 3, schalke,     [], olympiacos,  Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 3, arsenal,     [], olympiacos,  Time.cet('2012-10-03 20:45'), clr2 ],
   [ 3, olympiacos,  [], arsenal,     Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 4, schalke,     [], montpellier, Time.cet('2012-10-03 20:45'), clr2 ],
   [ 4, montpellier, [], schalke,     Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 3, arsenal,     [], schalke,     Time.cet('2012-10-24 20:45'), clr3 ],
   [ 3, schalke,     [], arsenal,     Time.cet('2012-11-06 20:45'), clr4 ]],
  [[ 4, montpellier, [], olympiacos,  Time.cet('2012-10-24 20:45'), clr3 ],
   [ 4, olympiacos,  [], montpellier, Time.cet('2012-11-06 20:45'), clr4 ]]
]

games_clc = [
  [[ 5, malaga,     [], zenit,      Time.cet('2012-09-18 20:45'), clr1 ],
   [ 5, zenit,      [], malaga,     Time.cet('2012-11-21 18:00'), clr5 ]],
  [[ 6, milan,      [], anderlecht, Time.cet('2012-09-18 20:45'), clr1 ],
   [ 6, anderlecht, [], milan,      Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 5, zenit,      [], milan,      Time.cet('2012-10-03 18:00'), clr2 ],
   [ 5, milan,      [], zenit,      Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 6, anderlecht, [], malaga,     Time.cet('2012-10-03 20:45'), clr2 ],
   [ 6, malaga,     [], anderlecht, Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 5, zenit,      [], anderlecht, Time.cet('2012-10-24 18:00'), clr3 ],
   [ 5, anderlecht, [], zenit,      Time.cet('2012-11-06 20:45'), clr4 ]],
  [[ 6, malaga,     [], milan,      Time.cet('2012-10-24 20:45'), clr3 ],
   [ 6, milan,      [], malaga,     Time.cet('2012-11-06 20:45'), clr4 ]]
]

games_cld = [
  [[ 7, madrid,   [], mancity,  Time.cet('2012-09-18 20:45'), clr1 ],
   [ 7, mancity,  [], madrid,   Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 8, dortmund, [], ajax,     Time.cet('2012-09-18 20:45'), clr1 ],
   [ 8, ajax,     [], dortmund, Time.cet('2012-11-21 20:45'), clr5 ]],
  [[ 7, ajax,     [], madrid,   Time.cet('2012-10-03 20:45'), clr2 ],
   [ 8, madrid,   [], ajax,     Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 8, mancity,  [], dortmund, Time.cet('2012-10-03 20:45'), clr2 ],
   [ 7, dortmund, [], mancity,  Time.cet('2012-12-04 20:45'), clr6 ]],
  [[ 7, dortmund, [], madrid,   Time.cet('2012-10-24 20:45'), clr3 ],
   [ 8, madrid,   [], dortmund, Time.cet('2012-11-06 20:45'), clr4 ]],
  [[ 8, ajax,     [], mancity,  Time.cet('2012-10-24 20:45'), clr3 ],
   [ 7, mancity,  [], ajax,     Time.cet('2012-11-06 20:45'), clr4 ]]
]


games_cle = [
  [[ 9,  chelsea,      [], juventus,     Time.cet('2012-09-19 20:45'), clr1 ],
   [ 9,  juventus,     [], chelsea,      Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 10, donezk,       [], nordsjalland, Time.cet('2012-09-19 20:45'), clr1 ],
   [ 10, nordsjalland, [], donezk,       Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 9,  nordsjalland, [], chelsea,      Time.cet('2012-10-02 20:45'), clr2 ],
   [ 9,  chelsea,      [], nordsjalland, Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 10, juventus,     [], donezk,       Time.cet('2012-10-02 20:45'), clr2 ],
   [ 10, donezk,       [], juventus,     Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 9,  donezk,       [], chelsea,      Time.cet('2012-10-23 20:45'), clr3 ],
   [ 9,  chelsea,      [], donezk,       Time.cet('2012-11-07 20:45'), clr4 ]],
  [[ 10, nordsjalland, [], juventus,     Time.cet('2012-10-23 20:45'), clr3 ],
   [ 10, juventus,     [], nordsjalland, Time.cet('2012-11-07 20:45'), clr4 ]]
]

games_clf = [
  [[ 11, bayern,   [], valencia, Time.cet('2012-09-19 20:45'), clr1 ],
   [ 11, valencia, [], bayern,   Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 12, lille,    [], borissow, Time.cet('2012-09-19 20:45'), clr1 ],
   [ 12, borissow, [], lille,    Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 11, borissow, [], bayern,   Time.cet('2012-10-02 20:45'), clr2 ],
   [ 12, bayern,   [], borissow, Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 12, valencia, [], lille,    Time.cet('2012-10-02 20:45'), clr2 ],
   [ 11, lille,    [], valencia, Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 11, lille,    [], bayern,   Time.cet('2012-10-23 20:45'), clr3 ],
   [ 11, bayern,   [], lille,    Time.cet('2012-11-07 20:45'), clr4 ]],
  [[ 12, borissow, [], valencia, Time.cet('2012-10-23 20:45'), clr3 ],
   [ 12, valencia, [], borissow, Time.cet('2012-11-07 20:45'), clr4 ]]
]

games_clg = [
  [[ 13, celtic,    [], benfica,   Time.cet('2012-09-19 20:45'), clr1 ],
   [ 14, benfica,   [], celtic,    Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 14, barcelona, [], spartak,   Time.cet('2012-09-19 20:45'), clr1 ],
   [ 13, spartak,   [], barcelona, Time.cet('2012-11-20 18:00'), clr5 ]],
  [[ 13, spartak,   [], celtic,    Time.cet('2012-10-02 18:00'), clr2 ],
   [ 14, celtic,    [], spartak,   Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 14, benfica,   [], barcelona, Time.cet('2012-10-02 20:45'), clr2 ],
   [ 13, barcelona, [], benfica,   Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 13, spartak,   [], benfica,   Time.cet('2012-10-23 18:00'), clr3 ],
   [ 14, benfica,   [], spartak,   Time.cet('2012-11-07 20:45'), clr4 ]],
  [[ 14, barcelona, [], celtic,    Time.cet('2012-10-23 20:45'), clr3 ],
   [ 13, celtic,    [], barcelona, Time.cet('2012-11-07 20:45'), clr4 ]]
]

games_clh = [
  [[ 15, manunited,   [], galatasaray, Time.cet('2012-09-19 20:45'), clr1 ],
   [ 15, galatasaray, [], manunited,   Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 16, braga,       [], cluj,        Time.cet('2012-09-19 20:45'), clr1 ],
   [ 16, cluj,        [], braga,       Time.cet('2012-11-20 20:45'), clr5 ]],
  [[ 15, cluj,        [], manunited,   Time.cet('2012-10-02 20:45'), clr2 ],
   [ 16, manunited,   [], cluj,        Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 16, galatasaray, [], braga,       Time.cet('2012-10-02 20:45'), clr2 ],
   [ 15, braga,       [], galatasaray, Time.cet('2012-12-05 20:45'), clr6 ]],
  [[ 15, manunited,   [], braga,       Time.cet('2012-10-23 20:45'), clr3 ],
   [ 15, braga,       [], manunited,   Time.cet('2012-11-07 20:45'), clr4 ]],
  [[ 16, galatasaray, [], cluj,        Time.cet('2012-10-23 20:45'), clr3 ],
   [ 16, cluj,        [], galatasaray, Time.cet('2012-11-07 20:45'), clr4 ]]
]

Game.create_pairs_from_ary_for_group!( games_cla, cla )
Game.create_pairs_from_ary_for_group!( games_clb, clb )
Game.create_pairs_from_ary_for_group!( games_clc, clc )
Game.create_pairs_from_ary_for_group!( games_cld, cld )
Game.create_pairs_from_ary_for_group!( games_cle, cle )
Game.create_pairs_from_ary_for_group!( games_clf, clf )
Game.create_pairs_from_ary_for_group!( games_clg, clg )
Game.create_pairs_from_ary_for_group!( games_clh, clh )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.cl.2012/13.version', :value => '1' )
