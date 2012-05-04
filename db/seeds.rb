# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


## todo: add title2 ?? to round
## add event.title to form in new games for round.title


######################################
## Oesterreichische Bundesliga 2012

bl = Event.create!( :title => 'Österr. Bundesliga 2012', :key => 'bl' )

sturm       = Team.create!( :title => 'SK Sturm Graz',       :key => 'sturm',       :img => 'sturm.png' )
ried        = Team.create!( :title => 'SV Ried',             :key => 'ried',        :img => 'ried.png' )
salzburg    = Team.create!( :title => 'FC RB Salzburg',      :key => 'salzburg',    :img => 'salzburg.png' )
austria     = Team.create!( :title => 'FK Austria Wien',     :key => 'austria',     :img => 'austria.png' )
rapid       = Team.create!( :title => 'SK Rapid Wien',       :key => 'rapid',       :img => 'rapid.png' )
wacker      = Team.create!( :title => 'FC Wacker Innsbruck', :key => 'wacker',      :img => 'wacker.png' )
neustadt    = Team.create!( :title => 'SC Wiener Neustadt',  :key => 'neustadt',    :img => 'neustadt.png' )
ksv         = Team.create!( :title => 'KSV 1919',            :key => 'ksv',         :img => 'ksv.png' )
mattersburg = Team.create!( :title => 'SV Mattersburg',      :key => 'mattersburg', :img => 'mattersburg.png' )
admira      = Team.create!( :title => 'FC Admira',           :key => 'admira',      :img => 'admira.png' )

bl.teams << sturm
bl.teams << salzburg
bl.teams << austria
bl.teams << ried
bl.teams << rapid
bl.teams << wacker
bl.teams << neustadt
bl.teams << ksv
bl.teams << mattersburg
bl.teams << admira


bl29 = Round.create!( :event => bl, :pos => 29, :title => '29. Runde : 7.+8. April 2012' )
bl30 = Round.create!( :event => bl, :pos => 30, :title => '30. Runde : 14.+15. April 2012' )
bl31 = Round.create!( :event => bl, :pos => 31, :title => '31. Runde : 21.+22. April 2012' )
bl32 = Round.create!( :event => bl, :pos => 32, :title => '32. Runde : 28.+29. April 2012' )
bl33 = Round.create!( :event => bl, :pos => 33, :title => '33. Runde : 5. Mai 2012' )
bl34 = Round.create!( :event => bl, :pos => 34, :title => '34. Runde : 10. Mai 2012' )
bl35 = Round.create!( :event => bl, :pos => 35, :title => '35. Runde : 13. Mai 2012' )
bl36 = Round.create!( :event => bl, :pos => 36, :title => '36. Runde : 17. Mai 2012' )

games_bl29 = [
  [ 1, salzburg,    2,  0, wacker,   '2012-04-07 16:00' ],
  [ 2, ried,        0,  1, austria,  '2012-04-07 18:30' ],
  [ 3, ksv,         2,  3, admira,   '2012-04-07 18:30' ],
  [ 4, rapid,       2,  1, neustadt, '2012-04-07 18:30' ],
  [ 5, mattersburg, 0,  2, sturm,    '2012-04-08 16:00' ]
]

games_bl30 = [
  [ 1, neustadt,    0,  0, ksv,         '2012-04-14 16:00' ],
  [ 2, admira,      1,  1, wacker,      '2012-04-14 18:30' ],
  [ 3, sturm,       2,  2, salzburg,    '2012-04-14 18:30' ],
  [ 4, ried,        2,  0, mattersburg, '2012-04-14 18:30' ],
  [ 5, austria,     0,  0, rapid,       '2012-04-15 16:00' ]
]

games_bl31 = [
  [ 1, wacker,      2,  0, neustadt, '2012-04-21 16:00' ],
  [ 2, ksv,         1,  0, austria,  '2012-04-21 18:30' ],
  [ 3, mattersburg, 1,  2, admira,   '2012-04-21 18:30' ],
  [ 4, salzburg,    2,  0, ried,     '2012-04-21 18:30' ],
  [ 5, rapid,       1,  1, sturm,    '2012-04-22 16:00' ]
]

games_bl32 = [
  [ 1, austria,     3,  0, wacker,   '2012-04-28 16:00' ],
  [ 2, neustadt,    1,  4, admira,   '2012-04-28 18:30' ],
  [ 3, mattersburg, 0,  1, salzburg, '2012-04-28 18:30' ],
  [ 4, sturm,       2,  1, ksv,      '2012-04-28 18:30' ],
  [ 5, ried,        2,  3, rapid,    '2012-04-29 16:00' ]
]

## todo: fix order (possible w/ import?? depends on pos? check)
games_bl33 = [
  [ 1, admira,    nil, nil, austria,     '2012-05-05 18:30' ],
  [ 2, rapid,     nil, nil, salzburg,    '2012-06-05 16:00' ],
  [ 3, ksv,       nil, nil, ried,        '2012-05-05 18:30' ],
  [ 4, neustadt,  nil, nil, sturm,       '2012-05-05 16:00' ],
  [ 5, wacker,    nil, nil, mattersburg, '2012-05-05 16:00' ]
]

games_bl34 = [
  [ 1, austria,     nil, nil, neustadt,     '2012-05-10 20:30' ],
  [ 2, ried,        nil, nil, wacker,       '2012-05-10 20:30' ],
  [ 3, salzburg,    nil, nil, ksv,          '2012-05-10 18:30' ],
  [ 4, mattersburg, nil, nil, rapid,        '2012-05-10 20:30' ],
  [ 5, sturm,       nil, nil, admira,       '2012-05-10 20:30' ]
]

games_bl35 = [
  [ 1, ksv,       nil, nil, rapid,       '2012-05-13 16:00' ],
  [ 2, wacker,    nil, nil, sturm,       '2012-05-13 16:00' ],
  [ 3, neustadt,  nil, nil, salzburg,    '2012-05-13 16:00' ],
  [ 4, admira,    nil, nil, ried,        '2012-05-13 16:00' ],
  [ 5, austria,   nil, nil, mattersburg, '2012-05-13 16:00' ]
]

games_bl36 = [
  [ 1, rapid,       nil, nil, wacker,      '2012-05-17 16:00' ],
  [ 2, ried,        nil, nil, neustadt,    '2012-05-17 16:00' ],
  [ 3, mattersburg, nil, nil, ksv,         '2012-05-17 16:00' ],
  [ 4, sturm,       nil, nil, austria,     '2012-05-17 16:00' ],
  [ 5, salzburg,    nil, nil, admira,      '2012-05-17 16:00' ]
]

Game.create_from_ary!( games_bl29, bl29 )
Game.create_from_ary!( games_bl30, bl30 )
Game.create_from_ary!( games_bl31, bl31 )
Game.create_from_ary!( games_bl32, bl32 )
Game.create_from_ary!( games_bl33, bl33 )
Game.create_from_ary!( games_bl34, bl34 )
Game.create_from_ary!( games_bl35, bl35 )
Game.create_from_ary!( games_bl36, bl36 )



##################################
### ÖFB Cup 2012

## todo: add link to oefb cup site (+ bundesliga.at??)

ofb = Event.create!( :title => 'ÖFB Cup 2012', :key => 'ofb', :team3 => false )

hartberg =  Team.create!( :title => 'TSV Hartberg',           :key => 'hartberg', :img => 'hartberg.png' )
groedig  =  Team.create!( :title => 'SV Grödig',              :key => 'groedig',  :img => 'groedig.png' )
juniors  =  Team.create!( :title => 'FC RB Juniors Salzburg', :key => 'juniors',  :img => 'salzburg.png' )
lustenau =  Team.create!( :title => 'SC Austria Lustenau',    :key => 'lustenau', :img => 'lustenau.png' )

ofb.teams << sturm
ofb.teams << hartberg
ofb.teams << groedig
ofb.teams << ried
ofb.teams << salzburg
ofb.teams << juniors
ofb.teams << lustenau
ofb.teams << austria

ofb8    = Round.create!( :event => ofb, :pos => 1, :title => 'Viertelfinale : 10.+11. April 2012' )
ofb4    = Round.create!( :event => ofb, :pos => 2, :title => 'Halbfinale : 1.+2. Mai 2012' )
ofb1    = Round.create!( :event => ofb, :pos => 3, :title => 'Finale : 20. Mai 2012' )

games_ofb8 = [
  [ 1, groedig,  2, 3, ried,     '2012-04-10 18:00' ],
  [ 2, lustenau, 1, 2, austria,  '2012-04-11 18:00' ],
  [ 3, sturm,    2, 2, hartberg, '2012-04-11 19:00' ],  ### fix: add 2:4 n.V.
  [ 4, salzburg, 4, 1, juniors,  '2012-04-11 19:00' ]
]

games_ofb4 = [
  [ 1, hartberg,  0, 1, salzburg, '2012-05-01 18:00' ],
  [ 2, ried,      2, 0, austria,  '2012-05-02 20:30' ]  
]

games_ofb1 = [
  [ 1, salzburg,  nil, nil, ried, '2012-05-20 16:00' ]  
]

Game.create_knockouts_from_ary!( games_ofb8, ofb8 )
Game.create_knockouts_from_ary!( games_ofb4, ofb4 )
Game.create_knockouts_from_ary!( games_ofb1, ofb1 )


#################################
### Champions League 2012

## note :team3 => false   CL has no 3rd place (only final game)
cl = Event.create!( :title => 'Champions League 2012', :key => 'cl', :team3 => false )

inter     = Team.create!( :title => 'FC Internazionale Milano', :key => 'inter',     :img => 'internazionale.png' )
marseille = Team.create!( :title => 'Olympique Marseille',      :key => 'marseille', :img => 'marseille.png' )
bayern    = Team.create!( :title => 'FC Bayern München',        :key => 'bayern',    :img => 'bayern.png' )
basel     = Team.create!( :title => 'FC Basel 1893',            :key => 'basel',     :img => 'basel.png' )

chelsea   = Team.create!( :title => 'Chelsea FC',       :key => 'chelsea', :img => 'chelsea.png' )
napoli    = Team.create!( :title => 'SSC Napoli',       :key => 'napoli',  :img => 'napoli.png')
madrid    = Team.create!( :title => 'Real Madrid CF',   :key => 'madrid',  :img => 'madrid.png' )
moskva    = Team.create!( :title => 'PFC CSKA Moskva',  :key => 'moskva',  :img => 'moskva.png' )

milan     = Team.create!( :title => 'AC Milan',         :key => 'milan',     :img => 'milan.png' )
benfica   = Team.create!( :title => 'Benfica Lissabon', :key => 'benfica',   :img => 'benfica.png' )
barcelona = Team.create!( :title => 'FC Barcelona',     :key => 'barcelona', :img => 'barcelona.png' )
apoel     = Team.create!( :title => 'APOEL Nikosia',    :key => 'apoel',     :img => 'apoel.png' )

cl.teams << milan
cl.teams << benfica
cl.teams << barcelona
cl.teams << apoel

cl.teams << chelsea
cl.teams << madrid
cl.teams << marseille
cl.teams << bayern


cl16   = Round.create!( :event => cl, :pos => 1, :title => 'Achtelfinale' )
cl16_2 = Round.create!( :event => cl, :pos => 2, :title => 'Achtelfinale Rückspiele' )
cl8    = Round.create!( :event => cl, :pos => 3, :title => 'Viertelfinale : 27.+28. März 2012' )
cl8_2  = Round.create!( :event => cl, :pos => 4, :title => 'Viertelfinale Rückspiele : 3.+4. April 2012' )
cl4    = Round.create!( :event => cl, :pos => 5, :title => 'Halbfinale : 17.+18. April 2012' )
cl4_2  = Round.create!( :event => cl, :pos => 6, :title => 'Halbfinale Rückspiele : 24.+25. April 2012' )
cl1    = Round.create!( :event => cl, :pos => 7, :title => 'Finale : 19. Mai 2012' )


games_cl16 = [
  [[ 1, napoli,    3, 1, chelsea,   '2012-02-21 20:45' ],
   [ 3, chelsea,   3, 1, napoli,    '2012-03-14 20:45' ]],
  [[ 2, moskva,    1, 1, madrid,    '2012-02-21 20:45' ],
   [ 4, madrid,    4, 1, moskva,    '2012-03-14 20:45' ]],
  [[ 3, marseille, 1, 0, inter,     '2012-02-22 20:45' ],
   [ 1, inter,     2, 1, marseille, '2012-03-13 20:45' ]],
  [[ 4, basel,     1, 0, bayern,    '2012-02-22 20:45' ],
   [ 2, bayern,    7, 0, basel,     '2012-03-13 20:45' ]] 
]

## todo/fix: add results n.V und i.E

games_cl8 = [
  [[ 1, apoel,       0,   3, madrid,    '2012-03-27 20:45' ],
   [ 4, madrid,      5,   2, apoel,     '2012-04-04 20:45' ]],
  [[ 2, benfica,     0,   1, chelsea,   '2012-03-27 20:45' ],
   [ 3, chelsea,     2,   1, benfica,   '2012-04-04 20:45' ]],
  [[ 3, marseille,   0,   2, bayern,    '2012-03-28 20:45' ],
   [ 2, bayern,      2,   0, marseille, '2012-04-03 20:45' ]],
  [[ 4, milan,       0,   0, barcelona, '2012-03-28 20:45' ],
   [ 1, barcelona,   3,   1, milan,     '2012-04-03 20:45' ]]
]

games_cl4 = [
  [[ 1, bayern,      2,   1, madrid,     '2012-04-17 20:45' ],
   [ 2, madrid,      2,   1, bayern,     '2012-04-25 20:45' ]],  ## add n.V und i.E. scores
  [[ 2, chelsea,     1,   0, barcelona,  '2012-04-18 20:45' ],
   [ 1, barcelona ,  2,   2, chelsea,    '2012-04-24 20:45' ]]
]

games_cl1 = [
  [ 1, bayern,      nil,   nil, chelsea,     '2012-05-19 20:45' ]]


Game.create_knockout_pairs_from_ary!( games_cl16, cl16, cl16_2 )
Game.create_knockout_pairs_from_ary!( games_cl8,  cl8,  cl8_2  )
Game.create_knockout_pairs_from_ary!( games_cl4,  cl4,  cl4_2  )
Game.create_knockouts_from_ary!( games_cl1,  cl1 )


#################################
### Europa League 2012

el = Event.create!( :title => 'Europa League 2012', :key => 'el', :team3 => false )

az       = Team.create!( :title => 'AZ Alkmaar',          :key => 'az',       :img => 'az.png' )
valencia = Team.create!( :title => 'Valencia CF',         :key => 'valencia', :img => 'valencia.png' )
schalke  = Team.create!( :title => 'FC Schalke 04',       :key => 'schalke',  :img => 'schalke.png' )
athletic = Team.create!( :title => 'Athletic Bilbao',     :key => 'athletic', :img => 'athletic.png' )
sporting = Team.create!( :title => 'Sporting Lisboa',     :key => 'sporting', :img => 'sporting.png' )
metalist = Team.create!( :title => 'FC Metalist Kharkiv', :key => 'metalist', :img => 'metalist.png' )
atletico = Team.create!( :title => 'Atlético Madrid',     :key => 'atletico', :img => 'atletico.png' )
hannover = Team.create!( :title => 'Hannover 96',         :key => 'hannover', :img => 'hannover.png' )

el.teams << az
el.teams << valencia
el.teams << schalke
el.teams << athletic
el.teams << sporting
el.teams << metalist
el.teams << atletico
el.teams << hannover

el8    = Round.create!( :event => el, :pos => 1, :title => 'Viertelfinale : 29. März 2012' )
el8_2  = Round.create!( :event => el, :pos => 2, :title => 'Viertelfinale Rückspiele : 5. April 2012' )
el4    = Round.create!( :event => el, :pos => 3, :title => 'Halbfinale : 19. April 2012' )
el4_2  = Round.create!( :event => el, :pos => 4, :title => 'Halbfinale Rückspiele : 26. April 2012' )
el1    = Round.create!( :event => el, :pos => 5, :title => 'Finale : 9. Mai 2012' )

## todo/fix: check for results n.V und i.E


games_el8 = [
  [[ 1, az,          2,   1, valencia,   '2012-03-29 21:05' ],
   [ 1, valencia,    4,   0, az,         '2012-04-05 21:05' ]],
  [[ 2, schalke,     2,   4, athletic,   '2012-03-29 21:05' ],
   [ 2, athletic,    2,   2, schalke,    '2012-04-05 21:05' ]],
  [[ 3, sporting,    2,   1, metalist,   '2012-03-29 21:05' ],
   [ 3, metalist,    1,   1, sporting,   '2012-04-05 21:05' ]],
  [[ 4, atletico,    2,   1, hannover,   '2012-03-29 21:05' ],
   [ 4, hannover,    1,   2, atletico,   '2012-04-05 21:05' ]]
]

games_el4 = [
  [[ 1, atletico,    4,   2, valencia,   '2012-04-19 21:05' ],
   [ 1, valencia,    0,   1, atletico,   '2012-04-26 21:05' ]],
  [[ 2, sporting,    2,   1, athletic,   '2012-04-19 21:05' ],
   [ 2, athletic,    3,   1, sporting,   '2012-04-26 21:05' ]]
]

games_el1 = [
  [ 1, atletico,    nil,   nil, athletic,   '2012-05-09 20:45' ]]


Game.create_knockout_pairs_from_ary!( games_el8, el8, el8_2 )
Game.create_knockout_pairs_from_ary!( games_el4, el4, el4_2 )
Game.create_knockouts_from_ary!( games_el1,  el1 )


#################################
### Euro 2012

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012


euro = Event.create!( :title => 'Euro 2012', :key => 'euro' )

#################################3
# Gruppe A

t1 = Team.create!( :title => 'Polen',        :key => 'poland', :img => 'poland2.png' )
t2 = Team.create!( :title => 'Griechenland', :key => 'greece', :img => 'greece2.png' )
t3 = Team.create!( :title => 'Russland',     :key => 'russia', :img => 'russia2.png' )
t4 = Team.create!( :title => 'Tschechien',   :key => 'czech',  :img => 'czech_republic2.png' )

euro.teams << t1
euro.teams << t2
euro.teams << t3
euro.teams << t4

round1 = Round.create!( :event => euro, :pos => 1, :title => 'Gruppe A' )

g1  = Game.create!( :pos=> 1, :round=>round1, :team1=>t1, :team2=>t2, :play_at => '2012-06-08 18:00', :score1=>1, :score2=>2 )
g2  = Game.create!( :pos=> 2, :round=>round1, :team1=>t3, :team2=>t4, :play_at => '2012-06-08 20:45', :score1=>0, :score2=>0 )

g9  = Game.create!( :pos=> 9, :round=>round1, :team1=>t2, :team2=>t4, :play_at => '2012-06-12 18:00', :score1=>2, :score2=>3 )
g10 = Game.create!( :pos=>10, :round=>round1, :team1=>t1, :team2=>t3, :play_at => '2012-06-12 20:45', :score1=>2, :score2=>1 )

g17 = Game.create!( :pos=>17, :round=>round1, :team1=>t2, :team2=>t3, :play_at => '2012-06-16 20:45', :score1=>4, :score2=>1 )
g18 = Game.create!( :pos=>18, :round=>round1, :team1=>t4, :team2=>t1, :play_at => '2012-06-16 20:45', :score1=>2, :score2=>0 )


#################################3
# Gruppe B

t5 = Team.create!( :title => 'Niederlande', :key => 'netherlands', :img => 'netherlands2.png' )
t6 = Team.create!( :title => 'Dänemark',    :key => 'denmark',     :img => 'denmark2.png' )
t7 = Team.create!( :title => 'Deutschland', :key => 'germany',     :img => 'germany2.png' )
t8 = Team.create!( :title => 'Portugal',    :key => 'portugal',    :img => 'portugal2.png' )

euro.teams << t5
euro.teams << t6
euro.teams << t7
euro.teams << t8

round2 = Round.create!( :event => euro, :pos => 2, :title => 'Gruppe B' )

games_euro_b = [
  [  3, t5, nil, nil, t6, '2012-06-09 18:00' ],
  [  4, t7, nil, nil, t8, '2012-06-09 20:45' ],
  [ 11, t6, nil, nil, t8, '2012-06-13 18:00' ],
  [ 12, t5, nil, nil, t7, '2012-06-13 20:45' ],
  [ 19, t8, nil, nil, t5, '2012-06-17 20:45' ],
  [ 20, t6, nil, nil, t7, '2012-06-17 20:45' ]]

Game.create_from_ary!( games_euro_b, round2 )

#################################3
# Gruppe C

t9  = Team.create!( :title => 'Spanien',  :key => 'spain',   :img => 'spain2.png' )
t10 = Team.create!( :title => 'Italien',  :key => 'italy',   :img => 'italy2.png' )
t11 = Team.create!( :title => 'Irland',   :key => 'ireland', :img => 'ireland2.png' )
t12 = Team.create!( :title => 'Kroatien', :key => 'croatia', :img => 'croatia2.png' )

round3 = Round.create!( :event => euro, :pos => 3, :title => 'Gruppe C' )

games_euro_c = [
  [  5, t9,  nil, nil, t10, '2012-06-10 18:00' ],
  [  6, t11, nil, nil, t12, '2012-06-10 20:45' ],
  [ 13, t10, nil, nil, t12, '2012-06-14 18:00' ],
  [ 14, t9,  nil, nil, t11, '2012-06-14 20:45' ],
  [ 21, t12, nil, nil, t9,  '2012-06-18 20:45' ],
  [ 22, t10, nil, nil, t11, '2012-06-18 20:45' ]]

Game.create_from_ary!( games_euro_c, round3 )

#################################3
# Gruppe D

t13 = Team.create!( :title => 'Ukraine',    :key => 'ukraine', :img => 'ukraine2.png' )
t14 = Team.create!( :title => 'Schweden',   :key => 'sweden',  :img => 'sweden2.png' )
t15 = Team.create!( :title => 'Frankreich', :key => 'france',  :img => 'france2.png' )
t16 = Team.create!( :title => 'England',    :key => 'england', :img => 'england2.png' )

round4 = Round.create!( :event => euro, :pos => 4, :title => 'Gruppe D' )

games_euro_d = [
  [  7, t15, nil, nil, t16, '2012-06-11 18:00' ],
  [  8, t13, nil, nil, t14, '2012-06-11 20:45' ],
  [ 16, t13, nil, nil, t15, '2012-06-15 18:00' ],
  [ 15, t14, nil, nil, t16, '2012-06-15 20:45' ],
  [ 23, t16, nil, nil, t13, '2012-06-19 20:45' ],
  [ 24, t14, nil, nil, t15, '2012-06-19 20:45' ]]

Game.create_from_ary!( games_euro_d, round4 )


################################################################
# Viertelfinale

t20 = Team.create!( :title => '1. Gruppe A', :key => 'euro1a', :calc => true )
t21 = Team.create!( :title => '2. Gruppe A', :key => 'euro2a', :calc => true )

t22 = Team.create!( :title => '1. Gruppe B', :key => 'euro1b', :calc => true )
t23 = Team.create!( :title => '2. Gruppe B', :key => 'euro2b', :calc => true )

t24 = Team.create!( :title => '1. Gruppe C', :key => 'euro1c', :calc => true )
t25 = Team.create!( :title => '2. Gruppe C', :key => 'euro2c', :calc => true )

t26 = Team.create!( :title => '1. Gruppe D', :key => 'euro1d', :calc => true )
t27 = Team.create!( :title => '2. Gruppe D', :key => 'euro2d', :calc => true )

round5 = Round.create!( :event => euro, :pos => 5, :title => 'Viertelfinale', :calc => true )

games_euro_viertel = [
  [ 25, t20, nil, nil, t23, '2012-06-21 20:45' ],
  [ 26, t22, nil, nil, t21, '2012-06-22 20:45' ],
  [ 27, t24, nil, nil, t27, '2012-06-23 20:45' ],
  [ 28, t26, nil, nil, t25, '2012-06-24 20:45' ]]

Game.create_knockouts_from_ary!( games_euro_viertel, round5 )


##############################################
# Halbfinale

t30 = Team.create!( :title => 'Sieger Viertelfinale 1', :key => 'euro25', :calc => true )  # Sieger Spiel 25
t31 = Team.create!( :title => 'Sieger Viertelfinale 2', :key => 'euro26', :calc => true )  # Sieger Spiel 26
t32 = Team.create!( :title => 'Sieger Viertelfinale 3', :key => 'euro27', :calc => true )  # Sieger Spiel 27
t33 = Team.create!( :title => 'Sieger Viertelfinale 4', :key => 'euro28', :calc => true )  # Sieger Spiel 28

round6 = Round.create!( :event => euro, :pos => 6, :title => 'Halbfinale', :calc => true )

games_euro_halb = [
  [ 29, t30, nil, nil, t32, '2012-06-27 20:45' ],
  [ 30, t31, nil, nil, t33, '2012-06-28 20:45' ]]

Game.create_knockouts_from_ary!( games_euro_halb, round6 )


################################################
# Finale

t40 = Team.create!( :title => 'Sieger Halbfinale 1', :key => 'euro29', :calc => true )  # Sieger Spiel 29
t41 = Team.create!( :title => 'Sieger Halbfinale 2', :key => 'euro30', :calc => true )  # Sieger Spiel 30

round7 = Round.create!( :event => euro, :pos => 7, :title => 'Finale', :calc => true )

games_euro_final = [[ 31, t40, nil, nil, t41, '2012-07-01 20:45' ]]

Game.create_knockouts_from_ary!( games_euro_final, round7 )




######################################
## NHL  2012

nhl = Event.create!( :title => ' National Hockey League 2012', :key => 'nhl' )

newjersey    = Team.create!( :title => 'New Jersey Devils (East/Atlantic)',    :key => 'newjersey', :img => 'devils.png' )
nyislanders  = Team.create!( :title => 'New York Islanders (East/Atlantic)',   :key => 'nyislanders', :img => 'islanders.png' )
nyrangers    = Team.create!( :title => 'New York Rangers (East/Atlantic)',     :key => 'nyrangers', :img => 'rangers.png' )
philadelphia = Team.create!( :title => 'Philadelphia Flyers (East/Atlantic)',  :key => 'philadelphia', :img => 'flyers.png' )
pittsburgh   = Team.create!( :title => 'Pittsburgh Penguins (East/Atlantic)',  :key => 'pittsburgh', :img => 'penguins.png' )

boston       = Team.create!( :title => 'Boston Bruis (East/Northeast)',        :key => 'boston', :img => 'bruins.png' )
buffalo      = Team.create!( :title => 'Buffalo Sabres (East/Northeast)',      :key => 'buffalo', :img => 'sabres.png' )
montreal     = Team.create!( :title => 'Montreal Canadiens (East/Northeast)',  :key => 'montreal', :img => 'canadiens.png' )
ottawa       = Team.create!( :title => 'Ottawa Senators (East/Northeast)',     :key => 'ottawa', :img => 'senators.png' )
toronto      = Team.create!( :title => 'Toronto Maple Leafs (East/Northeast)', :key => 'toronto', :img => 'mapleleafs.png' )

carolina     = Team.create!( :title => 'Carolina Hurricanes (East/Southeast)', :key => 'carolina', :img => 'hurricanes.png' )
florida      = Team.create!( :title => 'Florida Panthers (East/Southeast)',    :key => 'florida', :img => 'panthers.png' )
tampabay     = Team.create!( :title => 'Tampa Bay Lightning (East/Southeast)', :key => 'tampabay', :img => 'lightning.png' )
washington   = Team.create!( :title => 'Washington Capitals (East/Southeast)', :key => 'washington', :img => 'capitals.png' )
winnipeg     = Team.create!( :title => 'Winnipeg Jets (East/Southeast)',       :key => 'winnipeg', :img => 'jets.png' )

chicago      = Team.create!( :title => 'Chicago Blackhawks (West/Central)',    :key => 'chicago', :img => 'blackhawks.png' )
columbus     = Team.create!( :title => 'Columbus Blue Jackets (West/Central)', :key => 'columbus', :img => 'bluejackets.png' )
detroit      = Team.create!( :title => 'Detroit Red Wings (West/Central)',     :key => 'detroit', :img => 'redwings.png' )
nashville    = Team.create!( :title => 'Nashville Predators (West/Central)',   :key => 'nashville', :img => 'predators.png' )
stlouis      = Team.create!( :title => 'St. Louis Blues (West/Central)',       :key => 'stlouis', :img => 'blues.png' )

calgary      = Team.create!( :title => 'Calgary Flames (West/Northwest)',      :key => 'calgary', :img => 'flames.png' )
colorado     = Team.create!( :title => 'Colorado Avalanche (West/Northwest)',  :key => 'colorado', :img => 'avalanche.png' )
edmonton     = Team.create!( :title => 'Edmonton Oilers (West/Northwest)',     :key => 'edmonton', :img => 'oilers.png' )
minnesota    = Team.create!( :title => 'Minnesota Wild (West/Northwest)',      :key => 'minnesota', :img => 'wild.png' )
vancouver    = Team.create!( :title => 'Vancouver Canucks (West/Northwest)',   :key => 'vancouver', :img => 'canucks.png' )

anaheim      = Team.create!( :title => 'Anaheim Ducks (West/Pacific)',         :key => 'anaheim', :img => 'ducks.png' )
dallas       = Team.create!( :title => 'Dallas Stars (West/Pacific)',          :key => 'dallas', :img => 'stars.png' )
losangeles   = Team.create!( :title => 'Los Angeles Kings (West/Pacific)',     :key => 'losangeles', :img => 'kings.png' )
phoenix      = Team.create!( :title => 'Phoenix Coyotes (West/Pacific)',       :key => 'phoenix', :img => 'coyotes.png' )
sanjose      = Team.create!( :title => 'San Jose Sharks (West/Pacific)',       :key => 'sanjose', :img => 'sharks.png' )


nhl.teams << anaheim
nhl.teams << boston 
nhl.teams << buffalo
nhl.teams << calgary
nhl.teams << carolina
nhl.teams << chicago
nhl.teams << colorado
nhl.teams << columbus
nhl.teams << dallas
nhl.teams << detroit
nhl.teams << edmonton
nhl.teams << florida
nhl.teams << losangeles
nhl.teams << minnesota
nhl.teams << montreal
nhl.teams << nashville
nhl.teams << newjersey
nhl.teams << nyislanders
nhl.teams << nyrangers
nhl.teams << ottawa
nhl.teams << philadelphia
nhl.teams << phoenix
nhl.teams << pittsburgh
nhl.teams << sanjose
nhl.teams << stlouis
nhl.teams << tampabay
nhl.teams << toronto
nhl.teams << vancouver
nhl.teams << washington
nhl.teams << winnipeg


##############
##  Pools und Users

user1  = User.create!( :name => 'Behrooz SEIFI',      :email => 'behrooz' )
user2  = User.create!( :name => 'Gerald BAUER',       :email => 'gerald' )
user3  = User.create!( :name => 'Gürsel AYAZ',        :email => 'gürsel'  )
user4  = User.create!( :name => 'Richard TRAINDL',    :email => 'richard' )
user5  = User.create!( :name => 'Manfred KOPECEK',    :email => 'manfred' )
user6  = User.create!( :name => 'Clemens HUBER',      :email => 'clemens' )
user7  = User.create!( :name => 'Franz BAUER',        :email => 'franz' )
user8  = User.create!( :name => 'Ande S.',            :email => 'ande' )
user9  = User.create!( :name => 'Thomas SCHOLZ',      :email => 'thomas' )
user10 = User.create!( :name => 'Dietmar BAYERL',     :email => 'dietmar' )
user11 = User.create!( :name => 'Martina REININGER',  :email => 'martina' )
user12 = User.create!( :name => 'Andreas VANOREK',    :email => 'andy.vanorek' )
user13 = User.create!( :name => 'Franz RUPF',         :email => 'franz.rupf' )
user14 = User.create!( :name => 'Stefan NEUBAUER',    :email => 'stefan' )
user15 = User.create!( :name => 'Andreas KLAAR',      :email => 'andy.klaar' )
user16 = User.create!( :name => 'Mike KOITZ',         :email => 'mike' )
user17 = User.create!( :name => 'Harry PIETSCHMANN',  :email => 'harry' )
user18 = User.create!( :name => 'Wolfgang SKALA',     :email => 'wolfgang' )
user19 = User.create!( :name => 'Dietmar PFUNDNER',   :email => 'didi' )
user20 = User.create!( :name => 'Christian S.',       :email => 'christian.s' )
user21 = User.create!( :name => 'Christian Z.',       :email => 'christian.z' )
user22 = User.create!( :name => 'Dimy M.',            :email => 'dimy' )
user23 = User.create!( :name => 'Claudia Kotzian',    :email => 'claudia' )
user24 = User.create!( :name => 'Markus Brosch',      :email => 'markus' )


pool1 = Pool.create!( :event => euro, :title => 'UNIQA USS EF', :user => user1, :fix => true, :welcome => '' )
pool2 = Pool.create!( :event => euro, :title => 'UNIQA USS EF', :user => user1, :welcome => '' )
pool3 = Pool.create!( :event => cl,   :title => 'UNIQA USS EF', :user => user1, :welcome => '' )
pool4 = Pool.create!( :event => el,   :title => 'UNIQA USS EF', :user => user8, :welcome => '' )
pool5 = Pool.create!( :event => bl,   :title => 'UNIQA USS EF', :user => user5, :welcome => '' )
pool6 = Pool.create!( :event => ofb,  :title => 'UNIQA USS EF', :user => user5, :welcome => '' )



##############################################################################3
## note: diese tips and pool players nur zum testen; in produ entfernen

pool1.players << user1  # also add amin first
pool1.players << user2
pool1.players << user3
pool1.players << user4
pool1.players << user5
pool1.players << user6
pool1.players << user8
pool1.players << user9
pool1.players << user10
pool1.players << user11


Tip.create!( :user => user2, :pool => pool1, :game => g1,   :score1 => 2, :score2 => 4 )   # bingo
Tip.create!( :user => user2, :pool => pool1, :game => g2,   :score1 => 1, :score2 => 1 )   # bingoo
Tip.create!( :user => user2, :pool => pool1, :game => g9,   :score1 => 2, :score2 => 3 )   # bingooo
Tip.create!( :user => user2, :pool => pool1, :game => g10,  :score1 => 0, :score2 => 2 )

Tip.create!( :user => user3, :pool => pool1, :game => g1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => user3, :pool => pool1, :game => g2, :score1 => 1, :score2 => 4 ) 
