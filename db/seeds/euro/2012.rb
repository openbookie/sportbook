# encoding: utf-8

### fix/todo:
##   team3 => false

#euro = Event.create!( :key => 'euro',
#                      :title => 'Euro 2012',
#                      :team3 => false,
#                      :start_at => Time.cet( '2012-06-07 17:00' ))



##############################################
##  Flex Only Rounds for **Flex** Style Pool

## fix/todo: update fix flag

# euro8 = Round.create!( :event => euro, :pos => 4, :title => 'Viertelfinale', :fix => false )
# euro4 = Round.create!( :event => euro, :pos => 5, :title => 'Halbfinale',    :fix => false )
# euro1 = Round.create!( :event => euro, :pos => 6, :title => 'Finale',        :fix => false )


## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.euro.2012.2.version', :value => '1' )



### todo: split into its own file _quotes or _tipp3 etc.

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