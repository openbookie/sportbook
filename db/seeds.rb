# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

##################################
### ÖFB Cup 2012

## todo: add link to oefb cup site (+ bundesliga.at??)

ofb = Event.create!( :title => 'ÖFB Cup 2012', :key => 'ofb', :team3 => false )

sturm    =  Team.create!( :title => 'SK Sturm Graz',          :key => 'sturm',    :img => 'cup-sturm2.png' )
hartberg =  Team.create!( :title => 'TSV Hartberg',           :key => 'hartberg', :img => 'cup-hartberg2.png' )
groedig  =  Team.create!( :title => 'SV Grödig',              :key => 'groedig',  :img => 'cup-groedig2.png' )
ried     =  Team.create!( :title => 'SV Ried',                :key => 'ried',     :img => 'cup-ried2.png' )
salzburg =  Team.create!( :title => 'FC RB Salzburg',         :key => 'salzburg', :img => 'cup-salzburg2.png' )
juniors  =  Team.create!( :title => 'FC RB Juniors Salzburg', :key => 'juniors',  :img => 'cup-salzburg2.png' )
lustenau =  Team.create!( :title => 'SC Austria Lustenau',    :key => 'lustenau', :img => 'cup-lustenau2.png' )
austria  =  Team.create!( :title => 'FK Austria Wien',        :key => 'austria',  :img => 'cup-austria2.png' )

ofb.teams << sturm
ofb.teams << hartberg
ofb.teams << groedig
ofb.teams << ried
ofb.teams << salzburg
ofb.teams << juniors
ofb.teams << lustenau
ofb.teams << austria

ofb8    = Round.create!( :event => ofb, :pos => 1, :title => 'Viertelfinale : 10.+11. April 2012' )
ofb4    = Round.create!( :event => ofb, :pos => 2, :title => 'Halbfinale : 1.+2. Mai 2012',  :calc => true )
ofb1    = Round.create!( :event => ofb, :pos => 3, :title => 'Finale : 20. Mai 2012',        :calc => true )

GAMES_OFB8 = [
  [ 1, groedig,  nil, nil, ried,     '2012-04-10 18:00' ],
  [ 2, lustenau, nil, nil, austria,  '2012-04-11 18:00' ],
  [ 3, sturm,    nil, nil, hartberg, '2012-04-11 19:00' ],
  [ 4, salzburg, nil, nil, juniors,  '2012-04-11 19:00' ]
]

Game.create_knockouts_from_ary!( GAMES_OFB8, ofb8 )


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
cl4    = Round.create!( :event => cl, :pos => 5, :title => 'Halbfinale : 17.+18. April 2012',             :calc => true )
cl4_2  = Round.create!( :event => cl, :pos => 6, :title => 'Halbfinale Rückspiele : 24.+25. April 2012',  :calc => true )
cl1    = Round.create!( :event => cl, :pos => 7, :title => 'Finale : 19. Mai 2012',                       :calc => true )


GAMES_CL16 = [
  [[ 1, napoli,    3, 1, chelsea,   '2012-02-21 20:45' ],
   [ 3, chelsea,   3, 1, napoli,    '2012-03-14 20:45' ]],
  [[ 2, moskva,    1, 1, madrid,    '2012-02-21 20:45' ],
   [ 4, madrid,    4, 1, moskva,    '2012-03-14 20:45' ]],
  [[ 3, marseille, 1, 0, inter,     '2012-02-22 20:45' ],
   [ 1, inter,     2, 1, marseille, '2012-03-13 20:45' ]],
  [[ 4, basel,     1, 0, bayern,    '2012-02-22 20:45' ],
   [ 2, bayern,    7, 0, basel,     '2012-03-13 20:45' ]] 
]

GAMES_CL8 = [
  [[ 1, apoel,     nil, nil, madrid,    '2012-03-27 20:45' ],
   [ 4, madrid,    nil, nil, apoel,     '2012-04-04 20:45' ]],
  [[ 2, benfica,   nil, nil, chelsea,   '2012-03-27 20:45' ],
   [ 3, chelsea,   nil, nil, benfica,   '2012-04-04 20:45' ]],
  [[ 3, marseille, nil, nil, bayern,    '2012-03-28 20:45' ],
   [ 2, bayern,    nil, nil, marseille, '2012-04-03 20:45' ]],
  [[ 4, milan,     nil, nil, barcelona, '2012-03-28 20:45' ],
   [ 1, barcelona, nil, nil, milan,     '2012-04-03 20:45' ]]
]


Game.create_knockout_pairs_from_ary!( GAMES_CL16, cl16, cl16_2 )
Game.create_knockout_pairs_from_ary!( GAMES_CL8,  cl8,  cl8_2  )


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

GAMES_EURO_B = [
  [  3, t5, nil, nil, t6, '2012-06-09 18:00' ],
  [  4, t7, nil, nil, t8, '2012-06-09 20:45' ],
  [ 11, t6, nil, nil, t8, '2012-06-13 18:00' ],
  [ 12, t5, nil, nil, t7, '2012-06-13 20:45' ],
  [ 19, t8, nil, nil, t5, '2012-06-17 20:45' ],
  [ 20, t6, nil, nil, t7, '2012-06-17 20:45' ]]

Game.create_from_ary!( GAMES_EURO_B, round2 )

#################################3
# Gruppe C

t9  = Team.create!( :title => 'Spanien',  :key => 'spain',   :img => 'spain2.png' )
t10 = Team.create!( :title => 'Italien',  :key => 'italy',   :img => 'italy2.png' )
t11 = Team.create!( :title => 'Irland',   :key => 'ireland', :img => 'ireland2.png' )
t12 = Team.create!( :title => 'Kroatien', :key => 'croatia', :img => 'croatia2.png' )

round3 = Round.create!( :event => euro, :pos => 3, :title => 'Gruppe C' )

GAMES_EURO_C = [
  [  5, t9,  nil, nil, t10, '2012-06-10 18:00' ],
  [  6, t11, nil, nil, t12, '2012-06-10 20:45' ],
  [ 13, t10, nil, nil, t12, '2012-06-14 18:00' ],
  [ 14, t9,  nil, nil, t11, '2012-06-14 20:45' ],
  [ 21, t12, nil, nil, t9,  '2012-06-18 20:45' ],
  [ 22, t10, nil, nil, t11, '2012-06-18 20:45' ]]

Game.create_from_ary!( GAMES_EURO_C, round3 )

#################################3
# Gruppe D

t13 = Team.create!( :title => 'Ukraine',    :key => 'ukraine', :img => 'ukraine2.png' )
t14 = Team.create!( :title => 'Schweden',   :key => 'sweden',  :img => 'sweden2.png' )
t15 = Team.create!( :title => 'Frankreich', :key => 'france',  :img => 'france2.png' )
t16 = Team.create!( :title => 'England',    :key => 'england', :img => 'england2.png' )

round4 = Round.create!( :event => euro, :pos => 4, :title => 'Gruppe D' )

GAMES_EURO_D = [
  [  7, t15, nil, nil, t16, '2012-06-11 18:00' ],
  [  8, t13, nil, nil, t14, '2012-06-11 20:45' ],
  [ 16, t13, nil, nil, t15, '2012-06-15 18:00' ],
  [ 15, t14, nil, nil, t16, '2012-06-15 20:45' ],
  [ 23, t16, nil, nil, t13, '2012-06-19 20:45' ],
  [ 24, t14, nil, nil, t15, '2012-06-19 20:45' ]]

Game.create_from_ary!( GAMES_EURO_D, round4 )


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

GAMES_EURO_VIERTEL = [
  [ 25, t20, nil, nil, t23, '2012-06-21 20:45' ],
  [ 26, t22, nil, nil, t21, '2012-06-22 20:45' ],
  [ 27, t24, nil, nil, t27, '2012-06-23 20:45' ],
  [ 28, t26, nil, nil, t25, '2012-06-24 20:45' ]]

Game.create_knockouts_from_ary!( GAMES_EURO_VIERTEL, round5 )


##############################################
# Halbfinale

t30 = Team.create!( :title => 'Sieger Viertelfinale 1', :key => 'euro25', :calc => true )  # Sieger Spiel 25
t31 = Team.create!( :title => 'Sieger Viertelfinale 2', :key => 'euro26', :calc => true )  # Sieger Spiel 26
t32 = Team.create!( :title => 'Sieger Viertelfinale 3', :key => 'euro27', :calc => true )  # Sieger Spiel 27
t33 = Team.create!( :title => 'Sieger Viertelfinale 4', :key => 'euro28', :calc => true )  # Sieger Spiel 28

round6 = Round.create!( :event => euro, :pos => 6, :title => 'Halbfinale', :calc => true )

GAMES_EURO_HALB = [
  [ 29, t30, nil, nil, t32, '2012-06-27 20:45' ],
  [ 30, t31, nil, nil, t33, '2012-06-28 20:45' ]]

Game.create_knockouts_from_ary!( GAMES_EURO_HALB, round6 )


################################################
# Finale

t40 = Team.create!( :title => 'Sieger Halbfinale 1', :key => 'euro29', :calc => true )  # Sieger Spiel 29
t41 = Team.create!( :title => 'Sieger Halbfinale 2', :key => 'euro30', :calc => true )  # Sieger Spiel 30

round7 = Round.create!( :event => euro, :pos => 7, :title => 'Finale', :calc => true )

GAMES_EURO_FINAL = [[ 31, t40, nil, nil, t41, '2012-07-01 20:45' ]]

Game.create_knockouts_from_ary!( GAMES_EURO_FINAL, round7 )



##############
##  Pools und Users

user1  = User.create!( :name => 'Behrooz SEIFI',      :email => 'behrooz' )
user2  = User.create!( :name => 'Gerald BAUER',       :email => 'gerald' )
user3  = User.create!( :name => 'Gürsel AYAZ',        :email => 'gürsel'  )
user4  = User.create!( :name => 'Richard TRAINDL',    :email => 'richard' )
user5  = User.create!( :name => 'Manfred KOPECEK',    :email => 'manfred' )
user6  = User.create!( :name => 'Clemens HUBER',      :email => 'clemens' )
user7  = User.create!( :name => 'Franz BAUER',        :email => 'franz' )
user8  = User.create!( :name => 'Andy SCHEIBELHOFER', :email => 'andy' )
user9  = User.create!( :name => 'Thomas SCHOLZ',      :email => 'thomas' )
user10 = User.create!( :name => 'Dietmar BAYERL',     :email => 'dietmar' )
user11 = User.create!( :name => 'Martina REININGER',  :email => 'martina' )
user12 = User.create!( :name => 'Andreas VANOREK',    :email => 'andy.vanorek' )
user13 = User.create!( :name => 'Franz RUPF',         :email => 'franz.rupf' )
user14 = User.create!( :name => 'Stefan NEUBAUER',    :email => 'stefan' )


pool1 = Pool.create!( :event => euro, :title => 'UNIQA Fix', :user => user1, :fix => true, :welcome => 'Alles ist fix. Letzte Änderungen möglich Freitag, 8. Juni 6 Uhr abends d.h. bei Anpfiff des Eröffnungspiels.' )
pool2 = Pool.create!( :event => euro, :title => 'UNIQA Flex', :user => user1, :welcome => 'Nix is fix. Änderung bis vor Spielanpfiff möglich.' )
pool3 = Pool.create!( :event => cl,   :title => 'UNIQA Test', :user => user1, :welcome => '' )
pool4 = Pool.create!( :event => ofb,  :title => 'UNIQA Test', :user => user5, :welcome => '' )

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


pool3.players << user1  # also add amin first
pool3.players << user2
pool3.players << user5
pool3.players << user6
pool3.players << user7
pool3.players << user8
pool3.players << user9
pool3.players << user10
pool3.players << user11

## note: diese tips nur zum testen; in produ entfernen

Tip.create!( :user => user2, :pool => pool1, :game => g1,   :score1 => 2, :score2 => 4 )   # bingo
Tip.create!( :user => user2, :pool => pool1, :game => g2,   :score1 => 1, :score2 => 1 )   # bingoo
Tip.create!( :user => user2, :pool => pool1, :game => g9,   :score1 => 2, :score2 => 3 )   # bingooo
Tip.create!( :user => user2, :pool => pool1, :game => g10,  :score1 => 0, :score2 => 2 )


Tip.create!( :user => user3, :pool => pool1, :game => g1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => user3, :pool => pool1, :game => g2, :score1 => 1, :score2 => 4 ) 
