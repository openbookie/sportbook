# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


euro = Event.find_euro_2012!

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
Prop.create!( :key => 'db.seeds.euro.2012.calc.version', :value => '1' )
