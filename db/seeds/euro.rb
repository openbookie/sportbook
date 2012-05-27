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

t1 = pol = Team.create!( :title => 'Polen',        :tag => 'POL', :key => 'poland', :img => 'poland2.png' )
t2 = gre = Team.create!( :title => 'Griechenland', :tag => 'GRE', :key => 'greece', :img => 'greece2.png' )
t3 = rus = Team.create!( :title => 'Russland',     :tag => 'RUS', :key => 'russia', :img => 'russia2.png' )
t4 = cze = Team.create!( :title => 'Tschechien',   :tag => 'CZE', :key => 'czech',  :img => 'czech_republic2.png' )

euroa.teams << pol
euroa.teams << gre
euroa.teams << rus
euroa.teams << cze


#################################3
# Gruppe B

t5 = ned = Team.create!( :title => 'Niederlande', :tag => 'NED', :key => 'netherlands', :img => 'netherlands2.png' )
t6 = den = Team.create!( :title => 'Dänemark',    :tag => 'DEN', :key => 'denmark',     :img => 'denmark2.png' )
t7 = ger = Team.create!( :title => 'Deutschland', :tag => 'GER', :key => 'germany',     :img => 'germany2.png' )
t8 = por = Team.create!( :title => 'Portugal',    :tag => 'POR', :key => 'portugal',    :img => 'portugal2.png' )

eurob.teams << ned
eurob.teams << den
eurob.teams << ger
eurob.teams << por


#################################3
# Gruppe C

t9  = esp = Team.create!( :title => 'Spanien',  :tag => 'ESP', :key => 'spain',   :img => 'spain2.png' )
t10 = ita = Team.create!( :title => 'Italien',  :tag => 'ITA', :key => 'italy',   :img => 'italy2.png' )
t11 = irl = Team.create!( :title => 'Irland',   :tag => 'IRL', :key => 'ireland', :img => 'ireland2.png' )
t12 = cro = Team.create!( :title => 'Kroatien', :tag => 'CRO', :key => 'croatia', :img => 'croatia2.png' )

euroc.teams << esp
euroc.teams << ita
euroc.teams << irl
euroc.teams << cro

#################################3
# Gruppe D

t13 = ukr = Team.create!( :title => 'Ukraine',    :tag => 'UKR', :key => 'ukraine', :img => 'ukraine2.png' )
t14 = swe = Team.create!( :title => 'Schweden',   :tag => 'SWE', :key => 'sweden',  :img => 'sweden2.png' )
t15 = fra = Team.create!( :title => 'Frankreich', :tag => 'FRA', :key => 'france',  :img => 'france2.png' )
t16 = eng = Team.create!( :title => 'England',    :tag => 'ENG', :key => 'england', :img => 'england2.png' )

eurod.teams << ukr
eurod.teams << swe
eurod.teams << fra
eurod.teams << eng


euro.teams << pol
euro.teams << gre
euro.teams << rus
euro.teams << cze
euro.teams << ned
euro.teams << den
euro.teams << ger
euro.teams << por
euro.teams << esp
euro.teams << ita
euro.teams << irl
euro.teams << cro
euro.teams << ukr
euro.teams << swe
euro.teams << fra
euro.teams << eng

euro_round1 = Round.create!( :event => euro, :pos => 1, :title => 'Gruppenphase 1. Spieltag', :title2 => '8.-11. Juni' )
euro_round2 = Round.create!( :event => euro, :pos => 2, :title => 'Gruppenphase 2. Spieltag', :title2 => '12.-15. Juni' )
euro_round3 = Round.create!( :event => euro, :pos => 3, :title => 'Gruppenphase 3. Spieltag', :title2 => '16.-19. Juni' )

#### todo:
##  remove t1, t2, etc. replace with team tag

games_euro_round1 = [
  [  1, t1,  [], t2,  Time.cet('2012-06-08 18:00'), euroa ],
  [  2, t3,  [], t4,  Time.cet('2012-06-08 20:45'), euroa ],
  [  3, t5,  [], t6,  Time.cet('2012-06-09 18:00'), eurob ],
  [  4, t7,  [], t8,  Time.cet('2012-06-09 20:45'), eurob ],
  [  5, t9,  [], t10, Time.cet('2012-06-10 18:00'), euroc ],
  [  6, t11, [], t12, Time.cet('2012-06-10 20:45'), euroc ],
  [  7, t15, [], t16, Time.cet('2012-06-11 18:00'), eurod ],
  [  8, t13, [], t14, Time.cet('2012-06-11 20:45'), eurod ]
]

games_euro_round2 = [
  [  9, t2,  [], t4,  Time.cet('2012-06-12 18:00'), euroa ],
  [ 10, t1,  [], t3,  Time.cet('2012-06-12 20:45'), euroa ],
  [ 11, t6,  [], t8,  Time.cet('2012-06-13 18:00'), eurob ],
  [ 12, t5,  [], t7,  Time.cet('2012-06-13 20:45'), eurob ],
  [ 13, t10, [], t12, Time.cet('2012-06-14 18:00'), euroc ],
  [ 14, t9,  [], t11, Time.cet('2012-06-14 20:45'), euroc ],
  [ 16, t13, [], t15, Time.cet('2012-06-15 18:00'), eurod ],
  [ 15, t14, [], t16, Time.cet('2012-06-15 20:45'), eurod ]
]

games_euro_round3 = [
  [ 17, t2,  [], t3,  Time.cet('2012-06-16 20:45'), euroa ],
  [ 18, t4,  [], t1,  Time.cet('2012-06-16 20:45'), euroa ],
  [ 19, t8,  [], t5,  Time.cet('2012-06-17 20:45'), eurob ],
  [ 20, t6,  [], t7,  Time.cet('2012-06-17 20:45'), eurob ],
  [ 21, t12, [], t9,  Time.cet('2012-06-18 20:45'), euroc ],
  [ 22, t10, [], t11, Time.cet('2012-06-18 20:45'), euroc ],
  [ 23, t16, [], t13, Time.cet('2012-06-19 20:45'), eurod ],
  [ 24, t14, [], t15, Time.cet('2012-06-19 20:45'), eurod ]
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
  [ 25, c1a, [], c2b, Time.cet('2012-06-21 20:45') ],
  [ 26, c1b, [], c2a, Time.cet('2012-06-22 20:45') ],
  [ 27, c1c, [], c2d, Time.cet('2012-06-23 20:45') ],
  [ 28, c1d, [], c2c, Time.cet('2012-06-24 20:45') ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro8, calc_euro8 )


##############################################
# Halbfinale (Calc)

cv1 = CalcTeam.create!( :title => 'Sieger Viertelfinale 1', :key => 'euro25', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 25 ).id )  # Sieger Spiel 25
cv2 = CalcTeam.create!( :title => 'Sieger Viertelfinale 2', :key => 'euro26', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 26 ).id )  # Sieger Spiel 26
cv3 = CalcTeam.create!( :title => 'Sieger Viertelfinale 3', :key => 'euro27', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 27 ).id )  # Sieger Spiel 27
cv4 = CalcTeam.create!( :title => 'Sieger Viertelfinale 4', :key => 'euro28', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro8.id, 28 ).id )  # Sieger Spiel 28

calc_euro4 = CalcRound.create!( :event => euro, :pos => 5, :title => 'Halbfinale', :playoff => true )

calc_games_euro4 = [
  [ 29, cv1, [], cv3, Time.cet('2012-06-27 20:45') ],
  [ 30, cv2, [], cv4, Time.cet('2012-06-28 20:45') ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro4, calc_euro4 )


################################################
# Finale (Calc)

ch1 = CalcTeam.create!( :title => 'Sieger Halbfinale 1', :key => 'euro29', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro4.id, 29 ).id )  # Sieger Spiel 29
ch2 = CalcTeam.create!( :title => 'Sieger Halbfinale 2', :key => 'euro30', :calc_rule => 'game-winner', :calc_value => Game.find_by_round_id_and_pos!( calc_euro4.id, 30 ).id )  # Sieger Spiel 30

calc_euro1 = CalcRound.create!( :event => euro, :pos => 6, :title => 'Finale', :playoff => true )

calc_games_euro1 = [[ 31, ch1, [], ch2, Time.cet('2012-07-01 20:45') ]]

CalcGame.create_knockouts_from_ary!( calc_games_euro1, calc_euro1 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.version', :value => '1' )


########################
#
#  Add some quotes

# tipico quotes  27/may

tipico = Service.find_by_title!( 'tipico' )

TeamQuote.create!( :service => tipico, :event => euro, :team => esp, :odds => 3.6)
TeamQuote.create!( :service => tipico, :event => euro, :team => ger, :odds => 4.0)
TeamQuote.create!( :service => tipico, :event => euro, :team => ned, :odds => 8.0)
TeamQuote.create!( :service => tipico, :event => euro, :team => fra, :odds => 12)
TeamQuote.create!( :service => tipico, :event => euro, :team => eng, :odds => 12)
TeamQuote.create!( :service => tipico, :event => euro, :team => ita, :odds => 15)
TeamQuote.create!( :service => tipico, :event => euro, :team => por, :odds => 20)
TeamQuote.create!( :service => tipico, :event => euro, :team => rus, :odds => 25)
TeamQuote.create!( :service => tipico, :event => euro, :team => pol, :odds => 45)
TeamQuote.create!( :service => tipico, :event => euro, :team => cro, :odds => 50)
TeamQuote.create!( :service => tipico, :event => euro, :team => ukr, :odds => 50)
TeamQuote.create!( :service => tipico, :event => euro, :team => swe, :odds => 60)
TeamQuote.create!( :service => tipico, :event => euro, :team => gre, :odds => 70)
TeamQuote.create!( :service => tipico, :event => euro, :team => cze, :odds => 70)
TeamQuote.create!( :service => tipico, :event => euro, :team => den, :odds => 100)
TeamQuote.create!( :service => tipico, :event => euro, :team => irl, :odds => 100)

# group a
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 1,euro_round1.id), :odds1 =>2,   :oddsx =>3.3, :odds2 =>4   )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 2,euro_round1.id), :odds1 =>2.1, :oddsx =>3.3, :odds2 =>3.7 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 9,euro_round2.id), :odds1 =>3,   :oddsx =>3.2, :odds2 =>2.5 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(10,euro_round2.id), :odds1 =>3.1, :oddsx =>3.2, :odds2 =>2.4 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(17,euro_round3.id), :odds1 =>2.8, :oddsx =>3.3, :odds2 =>2.6 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(18,euro_round3.id), :odds1 =>4,   :oddsx =>3.4, :odds2 =>2 )


# group b

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 3,euro_round1.id), :odds1 =>1.6, :oddsx =>3.8, :odds2 =>6 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 4,euro_round1.id), :odds1 =>1.8, :oddsx =>3.5, :odds2 =>4.7 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(11,euro_round2.id), :odds1 =>4,   :oddsx =>3.5, :odds2 =>1.95 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(12,euro_round2.id), :odds1 =>3.3, :oddsx =>3.4, :odds2 =>2.25 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(19,euro_round3.id), :odds1 =>7,   :oddsx =>4.3, :odds2 =>1.5 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(20,euro_round3.id), :odds1 =>3.4, :oddsx =>3.4, :odds2 =>2.2 )

# group c

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 5,euro_round1.id), :odds1 =>1.8, :oddsx =>3.5, :odds2 =>4.8 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 6,euro_round1.id), :odds1 =>3.5, :oddsx =>3.3, :odds2 =>2.15 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(13,euro_round2.id), :odds1 =>2.1, :oddsx =>3.3, :odds2 =>3.7 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(14,euro_round2.id), :odds1 =>1.3, :oddsx =>5,   :odds2 =>12 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(21,euro_round3.id), :odds1 =>6.5,  :oddsx =>4,   :odds2 =>1.55 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(22,euro_round3.id), :odds1 =>1.75, :oddsx =>3.6, :odds2 =>5 )


# group d

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 7,euro_round1.id), :odds1 =>2.7, :oddsx =>3.2, :odds2 =>2.7 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!( 8,euro_round1.id), :odds1 =>2.3, :oddsx =>3.2, :odds2 =>3.4 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(15,euro_round2.id), :odds1 =>4.3, :oddsx =>3.3, :odds2 =>1.95 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(16,euro_round2.id), :odds1 =>3.5, :oddsx =>3.2, :odds2 =>2.2 )

Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(23,euro_round3.id), :odds1 =>2.15, :oddsx =>3.3, :odds2 =>3.6 )
Quote.create!( :service => tipico, :game => Game.find_by_pos_and_round_id!(24,euro_round3.id), :odds1 =>3.7,  :oddsx =>3.3, :odds2 =>2.1 )
