# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/euro/2012.rb"

#################################
##  Euro 2012

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012


euro = Event.create!( :key => 'euro',
                      :title => 'Euro 2012',
                      :team3 => false,
                      :start_at => Time.cet( '2012-06-07 17:00' ))

pol = Team.find_by_key!( 'pol' )
gre = Team.find_by_key!( 'gre' )
rus = Team.find_by_key!( 'rus' )
cze = Team.find_by_key!( 'cze' )

ned = Team.find_by_key!( 'ned' )
den = Team.find_by_key!( 'den' )
ger = Team.find_by_key!( 'ger' )
por = Team.find_by_key!( 'por' )

esp = Team.find_by_key!( 'esp' )
ita = Team.find_by_key!( 'ita' )
irl = Team.find_by_key!( 'irl' )
cro = Team.find_by_key!( 'cro' )

ukr = Team.find_by_key!( 'ukr' )
swe = Team.find_by_key!( 'swe' )
fra = Team.find_by_key!( 'fra' )
eng = Team.find_by_key!( 'eng' )


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



euroa = Group.create!( :event => euro, :pos => 1, :title => 'Gruppe A' )
eurob = Group.create!( :event => euro, :pos => 2, :title => 'Gruppe B' )
euroc = Group.create!( :event => euro, :pos => 3, :title => 'Gruppe C' )
eurod = Group.create!( :event => euro, :pos => 4, :title => 'Gruppe D' )

#################################
# Gruppe A

euroa.teams << pol
euroa.teams << gre
euroa.teams << rus
euroa.teams << cze


#################################
# Gruppe B

eurob.teams << ned
eurob.teams << den
eurob.teams << ger
eurob.teams << por


#################################3
# Gruppe C

euroc.teams << esp
euroc.teams << ita
euroc.teams << irl
euroc.teams << cro

#################################3
# Gruppe D

eurod.teams << ukr
eurod.teams << swe
eurod.teams << fra
eurod.teams << eng


euro_round1 = Round.create!( :event => euro, :pos => 1, :title => 'Vorrunde 1. Spieltag', :title2 => '8.-11. Juni' )
euro_round2 = Round.create!( :event => euro, :pos => 2, :title => 'Vorrunde 2. Spieltag', :title2 => '12.-15. Juni' )
euro_round3 = Round.create!( :event => euro, :pos => 3, :title => 'Vorrunde 3. Spieltag', :title2 => '16.-19. Juni' )


games_euro_round1 = [
  [  1, pol, [1,1], gre, Time.cet('2012-06-08 18:00'), euroa ],
  [  2, rus, [4,1], cze, Time.cet('2012-06-08 20:45'), euroa ],
  [  3, ned, [0,1], den, Time.cet('2012-06-09 18:00'), eurob ],
  [  4, ger, [1,0], por, Time.cet('2012-06-09 20:45'), eurob ],
  [  5, esp, [1,1], ita, Time.cet('2012-06-10 18:00'), euroc ],
  [  6, irl, [1,3], cro, Time.cet('2012-06-10 20:45'), euroc ],
  [  7, fra, [1,1], eng, Time.cet('2012-06-11 18:00'), eurod ],
  [  8, ukr, [2,1], swe, Time.cet('2012-06-11 20:45'), eurod ]
]

games_euro_round2 = [
  [  9, gre, [1,2], cze, Time.cet('2012-06-12 18:00'), euroa ],
  [ 10, pol, [1,1], rus, Time.cet('2012-06-12 20:45'), euroa ],
  [ 11, den, [2,3], por, Time.cet('2012-06-13 18:00'), eurob ],
  [ 12, ned, [1,2], ger, Time.cet('2012-06-13 20:45'), eurob ],
  [ 13, ita, [1,1], cro, Time.cet('2012-06-14 18:00'), euroc ],
  [ 14, esp, [4,0], irl, Time.cet('2012-06-14 20:45'), euroc ],
  [ 15, swe, [2,3], eng, Time.cet('2012-06-15 20:45'), eurod ],
  [ 16, ukr, [0,2], fra, Time.cet('2012-06-15 18:00'), eurod ]
]

games_euro_round3 = [
  [ 17, cze, [1,0], pol, Time.cet('2012-06-16 20:45'), euroa ],
  [ 18, gre, [1,0], rus, Time.cet('2012-06-16 20:45'), euroa ],
  [ 19, por, [2,1], ned, Time.cet('2012-06-17 20:45'), eurob ],
  [ 20, den, [1,2], ger, Time.cet('2012-06-17 20:45'), eurob ],
  [ 21, cro, [0,1], esp, Time.cet('2012-06-18 20:45'), euroc ],
  [ 22, ita, [2,0], irl, Time.cet('2012-06-18 20:45'), euroc ],
  [ 23, eng, [1,0], ukr, Time.cet('2012-06-19 20:45'), eurod ],
  [ 24, swe, [2,0], fra, Time.cet('2012-06-19 20:45'), eurod ]
]

Game.create_from_ary!( games_euro_round1, euro_round1 )
Game.create_from_ary!( games_euro_round2, euro_round2 )
Game.create_from_ary!( games_euro_round3, euro_round3 )


##############################################
##  Flex Only Rounds for **Flex** Style Pool

euro8 = Round.create!( :event => euro, :pos => 4, :title => 'Viertelfinale', :fix => false )
euro4 = Round.create!( :event => euro, :pos => 5, :title => 'Halbfinale',    :fix => false )
euro1 = Round.create!( :event => euro, :pos => 6, :title => 'Finale',        :fix => false )


games_euro8 = [
  [ 25, cze, [0,1], por, Time.cet('2012-06-21 20:45') ],
  [ 26, ger, [4,2], gre, Time.cet('2012-06-22 20:45') ],
  [ 27, esp, [2,0], fra, Time.cet('2012-06-23 20:45') ],
  [ 28, eng, [0,0,0,0,2,4], ita, Time.cet('2012-06-24 20:45') ]]

Game.create_knockouts_from_ary!( games_euro8, euro8 )

games_euro4 = [
  [ 29, por, [0,0,0,0,2,4], esp, Time.cet('2012-06-27 20:45') ],
  [ 30, ger, [1,2], ita, Time.cet('2012-06-28 20:45') ]]

Game.create_knockouts_from_ary!( games_euro4, euro4 )

games_euro1 = [
  [ 31, esp, [4,0], ita, Time.cet('2012-07-01 20:45') ]]

Game.create_knockouts_from_ary!( games_euro1, euro1 )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.2012.version', :value => '1' )



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
d15_swe_eng = Game.find_by_pos_and_round_id!(15,euro_round2.id)
d16_ukr_fra = Game.find_by_pos_and_round_id!(16,euro_round2.id)
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
 [ d15_swe_eng, 3,    2.9, 2.1  ],
 [ d16_ukr_fra, 3.8,  3,   1.75 ],
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
 [ d15_swe_eng,  4.3, 3.3, 1.95 ],
 [ d16_ukr_fra,  3.5, 3.2,  2.2 ], 
 [ a17_cze_pol,  2.8, 3.3,  2.6 ],
 [ a18_gre_rus,    4, 3.4,    2 ], 
 [ b19_por_ned,    7, 4.3,  1.5 ],
 [ b20_den_ger,  3.4, 3.4,  2.2 ],
 [ c21_cro_esp,  6.5,   4, 1.55 ],
 [ c22_ita_irl, 1.75, 3.6,    5 ],
 [ d23_eng_ukr, 2.15, 3.3,  3.6 ],
 [ d24_swe_fra,  3.7, 3.3,  2.1 ]]

Quote.create_from_ary!( tipico_odds, tipico )