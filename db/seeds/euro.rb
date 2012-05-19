# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro.rb"

#################################
##  Euro 2012

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012


euro = Event.create!( :title => 'Euro 2012', :key => 'euro', :team3 => false )

euroa = Group.create!( :event => euro, :pos => 1, :title => 'Gruppe A' )
eurob = Group.create!( :event => euro, :pos => 2, :title => 'Gruppe B' )
euroc = Group.create!( :event => euro, :pos => 3, :title => 'Gruppe C' )
eurod = Group.create!( :event => euro, :pos => 4, :title => 'Gruppe D' )

#################################3
# Gruppe A

t1 = Team.create!( :title => 'Polen',        :tag => 'POL', :key => 'poland', :img => 'poland2.png' )
t2 = Team.create!( :title => 'Griechenland', :tag => 'GRE', :key => 'greece', :img => 'greece2.png' )
t3 = Team.create!( :title => 'Russland',     :tag => 'RUS', :key => 'russia', :img => 'russia2.png' )
t4 = Team.create!( :title => 'Tschechien',   :tag => 'CZE', :key => 'czech',  :img => 'czech_republic2.png' )

euroa.teams << t1
euroa.teams << t2
euroa.teams << t3
euroa.teams << t4


#################################3
# Gruppe B

t5 = Team.create!( :title => 'Niederlande', :tag => 'NED', :key => 'netherlands', :img => 'netherlands2.png' )
t6 = Team.create!( :title => 'Dänemark',    :tag => 'DEN', :key => 'denmark',     :img => 'denmark2.png' )
t7 = Team.create!( :title => 'Deutschland', :tag => 'GER', :key => 'germany',     :img => 'germany2.png' )
t8 = Team.create!( :title => 'Portugal',    :tag => 'POR', :key => 'portugal',    :img => 'portugal2.png' )

eurob.teams << t5
eurob.teams << t6
eurob.teams << t7
eurob.teams << t8


#################################3
# Gruppe C

t9  = Team.create!( :title => 'Spanien',  :tag => 'ESP', :key => 'spain',   :img => 'spain2.png' )
t10 = Team.create!( :title => 'Italien',  :tag => 'ITA', :key => 'italy',   :img => 'italy2.png' )
t11 = Team.create!( :title => 'Irland',   :tag => 'IRL', :key => 'ireland', :img => 'ireland2.png' )
t12 = Team.create!( :title => 'Kroatien', :tag => 'CRO', :key => 'croatia', :img => 'croatia2.png' )

euroc.teams << t9
euroc.teams << t10
euroc.teams << t11
euroc.teams << t12

#################################3
# Gruppe D

t13 = Team.create!( :title => 'Ukraine',    :tag => 'UKR', :key => 'ukraine', :img => 'ukraine2.png' )
t14 = Team.create!( :title => 'Schweden',   :tag => 'SWE', :key => 'sweden',  :img => 'sweden2.png' )
t15 = Team.create!( :title => 'Frankreich', :tag => 'FRA', :key => 'france',  :img => 'france2.png' )
t16 = Team.create!( :title => 'England',    :tag => 'ENG', :key => 'england', :img => 'england2.png' )

eurod.teams << t13
eurod.teams << t14
eurod.teams << t15
eurod.teams << t16


euro.teams << t1
euro.teams << t2
euro.teams << t3
euro.teams << t4
euro.teams << t5
euro.teams << t6
euro.teams << t7
euro.teams << t9
euro.teams << t10
euro.teams << t11
euro.teams << t12
euro.teams << t13
euro.teams << t14
euro.teams << t15
euro.teams << t16


euro_round1 = Round.create!( :event => euro, :pos => 1, :title => 'Gruppenphase 1. Spieltag', :title2 => '8.-11. Juni' )
euro_round2 = Round.create!( :event => euro, :pos => 2, :title => 'Gruppenphase 2. Spieltag', :title2 => '12.-15. Juni' )
euro_round3 = Round.create!( :event => euro, :pos => 3, :title => 'Gruppenphase 3. Spieltag', :title2 => '16.-19. Juni' )

games_euro_round1 = [
  [  1, t1,  [], t2,  '2012-06-08 18:00', euroa ],
  [  2, t3,  [], t4,  '2012-06-08 20:45', euroa ],
  [  3, t5,  [], t6,  '2012-06-09 18:00', eurob ],
  [  4, t7,  [], t8,  '2012-06-09 20:45', eurob ],
  [  5, t9,  [], t10, '2012-06-10 18:00', euroc ],
  [  6, t11, [], t12, '2012-06-10 20:45', euroc ],
  [  7, t15, [], t16, '2012-06-11 18:00', eurod ],
  [  8, t13, [], t14, '2012-06-11 20:45', eurod ]
]

games_euro_round2 = [
  [  9, t2,  [], t4,  '2012-06-12 18:00', euroa ],
  [ 10, t1,  [], t3,  '2012-06-12 20:45', euroa ],
  [ 11, t6,  [], t8,  '2012-06-13 18:00', eurob ],
  [ 12, t5,  [], t7,  '2012-06-13 20:45', eurob ],
  [ 13, t10, [], t12, '2012-06-14 18:00', euroc ],
  [ 14, t9,  [], t11, '2012-06-14 20:45', euroc ],
  [ 16, t13, [], t15, '2012-06-15 18:00', eurod ],
  [ 15, t14, [], t16, '2012-06-15 20:45', eurod ]
]

games_euro_round3 = [
  [ 17, t2,  [], t3,  '2012-06-16 20:45', euroa ],
  [ 18, t4,  [], t1,  '2012-06-16 20:45', euroa ],
  [ 19, t8,  [], t5,  '2012-06-17 20:45', eurob ],
  [ 20, t6,  [], t7,  '2012-06-17 20:45', eurob ],
  [ 21, t12, [], t9,  '2012-06-18 20:45', euroc ],
  [ 22, t10, [], t11, '2012-06-18 20:45', euroc ],
  [ 23, t16, [], t13, '2012-06-19 20:45', eurod ],
  [ 24, t14, [], t15, '2012-06-19 20:45', eurod ]
]

Game.create_from_ary!( games_euro_round1, euro_round1 )
Game.create_from_ary!( games_euro_round2, euro_round2 )
Game.create_from_ary!( games_euro_round3, euro_round3 )


##############################################
##  Flex Only Rounds for **Flex** Style Pool

euro8 = Round.create!( :event => euro, :pos => 4, :title => 'Viertelfinale', :fix => false )
euro4 = Round.create!( :event => euro, :pos => 5, :title => 'Halbfinale',    :fix => false )
euro1 = Round.create!( :event => euro, :pos => 6, :title => 'Finale',        :fix => false )


##############################################
## Fix (Calc) Rounds for **Fix** Style Pool


################################################################
# Viertelfinale (Calc) 

c1a = CalcTeam.create!( :title => '1. Gruppe A', :key => 'euro1a', :calc_rule => 'group-winner', :calc_value => euroa.id )
c2a = CalcTeam.create!( :title => '2. Gruppe A', :key => 'euro2a', :calc_rule => 'group-2nd',    :calc_value => euroa.id )

c1b = CalcTeam.create!( :title => '1. Gruppe B', :key => 'euro1b', :calc_rule => 'group-winner', :calc_value => eurob.id )
c2b = CalcTeam.create!( :title => '2. Gruppe B', :key => 'euro2b', :calc_rule => 'group-2nd'   , :calc_value => eurob.id )

c1c = CalcTeam.create!( :title => '1. Gruppe C', :key => 'euro1c', :calc_rule => 'group-winner', :calc_value => euroc.id )
c2c = CalcTeam.create!( :title => '2. Gruppe C', :key => 'euro2c', :calc_rule => 'group-2nd',    :calc_value => euroc.id )

c1d = CalcTeam.create!( :title => '1. Gruppe D', :key => 'euro1d', :calc_rule => 'group-winner', :calc_value => eurod.id )
c2d = CalcTeam.create!( :title => '2. Gruppe D', :key => 'euro2d', :calc_rule => 'group-2nd',    :calc_value => eurod.id )


calc_euro8 = CalcRound.create!( :event => euro, :pos => 4, :title => 'Viertelfinale', :playoff => true )

calc_games_euro8 = [
  [ 25, c1a, [], c2b, '2012-06-21 20:45' ],
  [ 26, c1b, [], c2a, '2012-06-22 20:45' ],
  [ 27, c1c, [], c2d, '2012-06-23 20:45' ],
  [ 28, c1d, [], c2c, '2012-06-24 20:45' ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro8, calc_euro8 )


##############################################
# Halbfinale (Calc)

cv1 = CalcTeam.create!( :title => 'Sieger Viertelfinale 1', :key => 'euro25', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 25 ).id )  # Sieger Spiel 25
cv2 = CalcTeam.create!( :title => 'Sieger Viertelfinale 2', :key => 'euro26', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 26 ).id )  # Sieger Spiel 26
cv3 = CalcTeam.create!( :title => 'Sieger Viertelfinale 3', :key => 'euro27', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 27 ).id )  # Sieger Spiel 27
cv4 = CalcTeam.create!( :title => 'Sieger Viertelfinale 4', :key => 'euro28', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 28 ).id )  # Sieger Spiel 28

calc_euro4 = CalcRound.create!( :event => euro, :pos => 5, :title => 'Halbfinale', :playoff => true )

calc_games_euro4 = [
  [ 29, cv1, [], cv3, '2012-06-27 20:45' ],
  [ 30, cv2, [], cv4, '2012-06-28 20:45' ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro4, calc_euro4 )


################################################
# Finale (Calc)

ch1 = CalcTeam.create!( :title => 'Sieger Halbfinale 1', :key => 'euro29', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro4.id, 29 ).id )  # Sieger Spiel 29
ch2 = CalcTeam.create!( :title => 'Sieger Halbfinale 2', :key => 'euro30', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro4.id, 30 ).id )  # Sieger Spiel 30

calc_euro1 = CalcRound.create!( :event => euro, :pos => 6, :title => 'Finale', :playoff => true )

calc_games_euro1 = [[ 31, ch1, [], ch2, '2012-07-01 20:45' ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro1, calc_euro1 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.version', :value => '1' )

