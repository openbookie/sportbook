# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro.rb"

#################################
##  Euro 2012

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012


euro = Event.create!( :title => 'Euro 2012', :key => 'euro', :team3 => false, :start_at => Time.cet( '2012-06-07 17:00' ))

euroa = Group.create!( :event => euro, :pos => 1, :title => 'Gruppe A' )
eurob = Group.create!( :event => euro, :pos => 2, :title => 'Gruppe B' )
euroc = Group.create!( :event => euro, :pos => 3, :title => 'Gruppe C' )
eurod = Group.create!( :event => euro, :pos => 4, :title => 'Gruppe D' )

#################################
# Gruppe A

pol = Team.create!( :title => 'Polen',        :tag => 'POL', :key => 'poland', :img => 'poland2.png' )
gre = Team.create!( :title => 'Griechenland', :tag => 'GRE', :key => 'greece', :img => 'greece2.png' )
rus = Team.create!( :title => 'Russland',     :tag => 'RUS', :key => 'russia', :img => 'russia2.png' )
cze = Team.create!( :title => 'Tschechien',   :tag => 'CZE', :key => 'czech',  :img => 'czech_republic2.png' )

euroa.teams << pol
euroa.teams << gre
euroa.teams << rus
euroa.teams << cze


#################################
# Gruppe B

ned = Team.create!( :title => 'Niederlande', :tag => 'NED', :key => 'netherlands', :img => 'netherlands2.png' )
den = Team.create!( :title => 'Dänemark',    :tag => 'DEN', :key => 'denmark',     :img => 'denmark2.png' )
ger = Team.create!( :title => 'Deutschland', :tag => 'GER', :key => 'germany',     :img => 'germany2.png' )
por = Team.create!( :title => 'Portugal',    :tag => 'POR', :key => 'portugal',    :img => 'portugal2.png' )

eurob.teams << ned
eurob.teams << den
eurob.teams << ger
eurob.teams << por


#################################3
# Gruppe C

esp = Team.create!( :title => 'Spanien',  :tag => 'ESP', :key => 'spain',   :img => 'spain2.png' )
ita = Team.create!( :title => 'Italien',  :tag => 'ITA', :key => 'italy',   :img => 'italy2.png' )
irl = Team.create!( :title => 'Irland',   :tag => 'IRL', :key => 'ireland', :img => 'ireland2.png' )
cro = Team.create!( :title => 'Kroatien', :tag => 'CRO', :key => 'croatia', :img => 'croatia2.png' )

euroc.teams << esp
euroc.teams << ita
euroc.teams << irl
euroc.teams << cro

#################################3
# Gruppe D

ukr = Team.create!( :title => 'Ukraine',    :tag => 'UKR', :key => 'ukraine', :img => 'ukraine2.png' )
swe = Team.create!( :title => 'Schweden',   :tag => 'SWE', :key => 'sweden',  :img => 'sweden2.png' )
fra = Team.create!( :title => 'Frankreich', :tag => 'FRA', :key => 'france',  :img => 'france2.png' )
eng = Team.create!( :title => 'England',    :tag => 'ENG', :key => 'england', :img => 'england2.png' )

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


games_euro_round1 = [
  [  1, pol, [], gre, Time.cet('2012-06-08 18:00'), euroa ],
  [  2, rus, [], cze, Time.cet('2012-06-08 20:45'), euroa ],
  [  3, ned, [], den, Time.cet('2012-06-09 18:00'), eurob ],
  [  4, ger, [], por, Time.cet('2012-06-09 20:45'), eurob ],
  [  5, esp, [], ita, Time.cet('2012-06-10 18:00'), euroc ],
  [  6, irl, [], cro, Time.cet('2012-06-10 20:45'), euroc ],
  [  7, fra, [], eng, Time.cet('2012-06-11 18:00'), eurod ],
  [  8, ukr, [], swe, Time.cet('2012-06-11 20:45'), eurod ]
]

games_euro_round2 = [
  [  9, gre, [], cze, Time.cet('2012-06-12 18:00'), euroa ],
  [ 10, pol, [], rus, Time.cet('2012-06-12 20:45'), euroa ],
  [ 11, den, [], por, Time.cet('2012-06-13 18:00'), eurob ],
  [ 12, ned, [], ger, Time.cet('2012-06-13 20:45'), eurob ],
  [ 13, ita, [], cro, Time.cet('2012-06-14 18:00'), euroc ],
  [ 14, esp, [], irl, Time.cet('2012-06-14 20:45'), euroc ],
  [ 16, ukr, [], fra, Time.cet('2012-06-15 18:00'), eurod ],
  [ 15, swe, [], eng, Time.cet('2012-06-15 20:45'), eurod ]
]

games_euro_round3 = [
  [ 17, gre, [], rus, Time.cet('2012-06-16 20:45'), euroa ],
  [ 18, cze, [], pol, Time.cet('2012-06-16 20:45'), euroa ],
  [ 19, por, [], ned, Time.cet('2012-06-17 20:45'), eurob ],
  [ 20, den, [], ger, Time.cet('2012-06-17 20:45'), eurob ],
  [ 21, cro, [], esp, Time.cet('2012-06-18 20:45'), euroc ],
  [ 22, ita, [], irl, Time.cet('2012-06-18 20:45'), euroc ],
  [ 23, eng, [], ukr, Time.cet('2012-06-19 20:45'), eurod ],
  [ 24, swe, [], fra, Time.cet('2012-06-19 20:45'), eurod ]
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

a1_pol_gre  = Game.find_by_pos_and_round_id!( 1,euro_round1.id)
a2_rus_cze  = Game.find_by_pos_and_round_id!( 2,euro_round1.id)
a9_gre_cze  = Game.find_by_pos_and_round_id!( 9,euro_round2.id)
a10_pol_rus = Game.find_by_pos_and_round_id!(10,euro_round2.id)
a17_cze_pol = Game.find_by_pos_and_round_id!(17,euro_round3.id)
a18_gre_rus = Game.find_by_pos_and_round_id!(18,euro_round3.id)

b3_ned_den  = Game.find_by_pos_and_round_id!( 3,euro_round1.id)
b4_ger_por  = Game.find_by_pos_and_round_id!( 4,euro_round1.id)
b11_den_por = Game.find_by_pos_and_round_id!(11,euro_round2.id)
b12_ned_ger = Game.find_by_pos_and_round_id!(12,euro_round2.id)
b19_por_ned = Game.find_by_pos_and_round_id!(19,euro_round3.id)
b20_den_ger = Game.find_by_pos_and_round_id!(20,euro_round3.id)

c5_esp_ita  = Game.find_by_pos_and_round_id!( 5,euro_round1.id)
c6_irl_cro  = Game.find_by_pos_and_round_id!( 6,euro_round1.id)
c13_ita_cro = Game.find_by_pos_and_round_id!(13,euro_round2.id)
c14_esp_irl = Game.find_by_pos_and_round_id!(14,euro_round2.id)
c21_cro_esp = Game.find_by_pos_and_round_id!(21,euro_round3.id)
c22_ita_irl = Game.find_by_pos_and_round_id!(22,euro_round3.id)

d7_fra_eng  = Game.find_by_pos_and_round_id!( 7,euro_round1.id)
d8_ukr_swe  = Game.find_by_pos_and_round_id!( 8,euro_round1.id)
d15_ukr_fra = Game.find_by_pos_and_round_id!(15,euro_round2.id)
d16_swe_eng = Game.find_by_pos_and_round_id!(16,euro_round2.id)
d23_eng_ukr = Game.find_by_pos_and_round_id!(23,euro_round3.id)
d24_swe_fra = Game.find_by_pos_and_round_id!(24,euro_round3.id)


tipico    = Service.find_by_key!( 'tipico'    )
betathome = Service.find_by_key!( 'betathome' )
tipp3     = Service.find_by_key!( 'tipp3'     )


tipico_winner_odds = [   # tipico quotes  27/may
  [ esp, 3.6 ],
  [ ger, 4 ],
  [ ned, 8 ],
  [ fra, 12 ],
  [ eng, 12 ],
  [ ita, 15 ],
  [ por, 20 ],
  [ rus, 25 ],
  [ pol, 45 ],
  [ cro, 50 ],
  [ ukr, 50 ],
  [ swe, 60 ],
  [ gre, 70 ],
  [ cze, 70 ],
  [ den, 100 ],
  [ irl, 100 ]]

EventQuote.create_from_ary!( tipico_winner_odds, tipico, euro )


betathome_winner_odds = [
  [ esp, 3.5 ],
  [ ger, 3.9 ],
  [ ned, 7.5 ],
  [ eng, 10 ],
  [ fra, 15 ],
  [ ita, 15 ],
  [ por, 18 ],
  [ rus, 20 ],
  [ cro, 40 ],
  [ ukr, 40 ],
  [ cze, 50 ],
  [ gre, 50 ],
  [ pol, 50 ],
  [ swe, 65 ],
  [ den, 80 ],
  [ irl, 80 ]] 

EventQuote.create_from_ary!( betathome_winner_odds, betathome, euro )


tipp3_winner_odds = [
  [ esp, 3.5 ],
  [ ger, 3.8 ],
  [ ned, 8 ],
  [ eng, 12 ],
  [ ita, 12 ],
  [ fra, 12 ],
  [ por, 20 ],
  [ rus, 25 ],
  [ cro, 50 ],
  [ ukr, 50 ],
  [ pol, 60 ],
  [ cze, 70 ],
  [ gre, 70 ],
  [ swe, 75 ],
  [ den, 90 ],
  [ irl, 90 ]]

EventQuote.create_from_ary!( tipp3_winner_odds, tipp3, euro )

tipp3_groupa_winner_odds = [
  [ rus, 2.3  ],
  [ pol, 3.4  ],
  [ cze, 4.5  ],
  [ gre, 5    ]]
tipp3_groupb_winner_odds = [
  [ ger, 2.1  ],
  [ ned, 2.6  ],
  [ por, 4.5  ],
  [ den, 15   ]]
tipp3_groupc_winner_odds = [
  [ esp, 1.45 ],
  [ ita, 4    ],
  [ cro, 6.5  ],
  [ irl, 18   ]]
tipp3_groupd_winner_odds = [
  [ eng, 2.6  ],
  [ fra, 2.6  ],
  [ ukr, 5    ],
  [ swe, 6    ]]

GroupQuote.create_from_ary!( tipp3_groupa_winner_odds, tipp3, euroa )
GroupQuote.create_from_ary!( tipp3_groupb_winner_odds, tipp3, eurob )
GroupQuote.create_from_ary!( tipp3_groupc_winner_odds, tipp3, euroc )
GroupQuote.create_from_ary!( tipp3_groupd_winner_odds, tipp3, eurod )

tipico_groupa_winner_odds = [
  [ rus, 2.5  ],
  [ pol, 3.6  ],
  [ cze, 4.7  ],
  [ gre, 5.5  ]]
tipico_groupb_winner_odds = [
  [ ger, 2.05 ],
  [ ned, 2.9  ],
  [ por, 5    ],
  [ den, 20   ]]
tipico_groupc_winner_odds = [
  [ esp, 1.55 ],
  [ ita, 4    ],
  [ cro, 8    ],
  [ irl, 18   ]]
tipico_groupd_winner_odds = [
  [ fra, 2.6  ],
  [ eng, 2.7  ],
  [ ukr, 5.5  ],
  [ swe, 7    ]]

GroupQuote.create_from_ary!( tipico_groupa_winner_odds, tipico, euroa )
GroupQuote.create_from_ary!( tipico_groupb_winner_odds, tipico, eurob )
GroupQuote.create_from_ary!( tipico_groupc_winner_odds, tipico, euroc )
GroupQuote.create_from_ary!( tipico_groupd_winner_odds, tipico, eurod )


tipp3_odds = [
 [ a1_pol_gre,  2,    2.9, 3.2  ],
 [ a2_rus_cze,  2.1,  2.9, 3    ],
 [ b3_ned_den,  1.55, 3.3, 4.9  ],
 [ b4_ger_por,  1.7,  3.1, 3.9  ],
 [ c5_esp_ita,  1.7,  3.1, 3.9  ],
 [ c6_irl_cro,  3.1,  2.9, 2.0  ],
 [ d7_fra_eng,  2.4,  2.9, 2.4  ],
 [ d8_ukr_swe,  2.2,  2.9, 2.8  ],
 [ a9_gre_cze,  2.6,  2.9, 2.3  ],
 [ a10_pol_rus, 2.7,  3,   2.2  ],
 [ b11_den_por, 3.5,  3.1, 1.8  ],
 [ b12_ned_ger, 2.8,  3,   2.2  ],
 [ c13_ita_cro, 2,    2.9, 3.3  ],
 [ c14_esp_irl, 1.3,  4.0, 7.4  ],
 [ d15_ukr_fra, 3,    2.9, 2.1  ],
 [ d16_swe_eng, 3.8,  3,   1.75 ],
 [ a17_cze_pol, 2.4,  2.9, 2.4  ],
 [ a18_gre_rus, 3.2,  3,   1.9  ],
 [ b19_por_ned, 3,    2.9, 2    ],
 [ b20_den_ger, 5.9,  3.4, 1.45 ],
 [ c21_cro_esp, 5.2,  3.4, 1.5  ],
 [ c22_ita_irl, 1.65, 3.1, 4.2  ],
 [ d23_eng_ukr, 2,    3,   3.1  ],
 [ d24_swe_fra, 3.3,  3,   1.9  ]]

Quote.create_from_ary!( tipp3_odds, tipp3 )

tipico_odds = [
 [ a1_pol_gre,     2, 3.3,    4 ],
 [ a2_rus_cze,   2.1, 3.3,  3.7 ],
 [ b3_ned_den,   1.6, 3.8,    6 ], 
 [ b4_ger_por,   1.8, 3.5,  4.7 ], 
 [ c5_esp_ita,   1.8, 3.5,  4.8 ],
 [ c6_irl_cro,   3.5, 3.3, 2.15 ],
 [ d7_fra_eng,   2.7, 3.2,  2.7 ],
 [ d8_ukr_swe,   2.3, 3.2,  3.4 ],
 [ a9_gre_cze,     3, 3.2,  2.5 ],
 [ a10_pol_rus,  3.1, 3.2,  2.4 ],
 [ b11_den_por,    4, 3.5, 1.95 ],
 [ b12_ned_ger,  3.3, 3.4, 2.25 ],
 [ c13_ita_cro,  2.1, 3.3,  3.7 ], 
 [ c14_esp_irl,  1.3,   5,   12 ], 
 [ d15_ukr_fra,  4.3, 3.3, 1.95 ],
 [ d16_swe_eng,  3.5, 3.2,  2.2 ], 
 [ a17_cze_pol,  2.8, 3.3,  2.6 ],
 [ a18_gre_rus,    4, 3.4,    2 ], 
 [ b19_por_ned,    7, 4.3,  1.5 ],
 [ b20_den_ger,  3.4, 3.4,  2.2 ],
 [ c21_cro_esp,  6.5,   4, 1.55 ],
 [ c22_ita_irl, 1.75, 3.6,    5 ],
 [ d23_eng_ukr, 2.15, 3.3,  3.6 ],
 [ d24_swe_fra,  3.7, 3.3,  2.1 ]]

Quote.create_from_ary!( tipico_odds, tipico )