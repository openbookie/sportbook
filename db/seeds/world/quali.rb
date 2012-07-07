# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)

puts "*** loading seed data in seeds/world/quali.rb"

#################################
##  WM 2014 - Qualification Europe


world = Event.create!( :title => 'WM Quali. Europa 2012/13', :key => 'wmql', :start_at => Time.cet( '2012-09-07 00:00' ))

worldc = Group.create!( :event => world, :pos => 1, :title => 'Gruppe C' )


#################################3
# Gruppe C

ger = Team.create!( :title => 'Deutschland', :tag => 'GER', :key => 'ger', :img => 'euro/germany2.png' )
far = Team.create!( :title => 'Färöer',      :tag => 'FAR', :key => 'far', :img => 'euro/faroer2.png' )
irl = Team.create!( :title => 'Irland',      :tag => 'IRL', :key => 'irl', :img => 'euro/ireland2.png' )
kaz = Team.create!( :title => 'Kasachstan',  :tag => 'KAZ', :key => 'kaz', :img => 'euro/kaz2.png' )
aut = Team.create!( :title => 'Österreich',  :tag => 'AUT', :key => 'aut', :img => 'euro/austria2.png' )
swe = Team.create!( :title => 'Schweden',    :tag => 'SWE', :key => 'swe', :img => 'euro/sweden2.png' )

worldc.teams << ger
worldc.teams << far
worldc.teams << irl
worldc.teams << kaz
worldc.teams << aut
worldc.teams << swe


world.teams << ger
world.teams << far
world.teams << irl
world.teams << kaz
world.teams << aut
world.teams << swe


world1 = Round.create!( :event => world, :pos => 1, :title => 'Quali - 7.+11. Sep 2012' )
world2 = Round.create!( :event => world, :pos => 2, :title => 'Quali - 12.+16. Okt 2012' )
world3 = Round.create!( :event => world, :pos => 3, :title => 'Quali - 22.+26. Mär 2013' )
world4 = Round.create!( :event => world, :pos => 4, :title => 'Quali - 7..+11. Jun 2013' )
world5 = Round.create!( :event => world, :pos => 5, :title => 'Quali - 6..+10. Sep 2013' )
world6 = Round.create!( :event => world, :pos => 6, :title => 'Quali - 11..+15. Okt 2013' )

games_world1 = [
 [ 1,  ger, [], far, Time.cet( '2012-09-07 00:00' ) ],
 [ 2,  kaz, [], irl, Time.cet( '2012-09-07 00:00' ) ],
 [ 3,  aut, [], ger, Time.cet( '2012-09-11 00:00' ) ],
 [ 4,  swe, [], kaz, Time.cet( '2012-09-11 00:00' ) ]]

games_world2 = [
 [  5,  irl, [], ger, Time.cet( '2012-10-12 00:00' ) ],
 [  6,  far, [], swe, Time.cet( '2012-10-12 00:00' ) ],
 [  7,  kaz, [], aut, Time.cet( '2012-10-12 00:00' ) ],
 [  8,  ger, [], swe, Time.cet( '2012-10-16 00:00' ) ],
 [  9,  far, [], irl, Time.cet( '2012-10-16 00:00' ) ],
 [ 10,  aut, [], kaz, Time.cet( '2012-10-16 00:00' ) ]]

games_world3 = [
 [ 11,  kaz, [], ger, Time.cet( '2013-03-22 00:00' ) ],
 [ 12,  aut, [], far, Time.cet( '2013-03-22 00:00' ) ],
 [ 13,  swe, [], irl, Time.cet( '2013-03-22 00:00' ) ],
 [ 14,  ger, [], kaz, Time.cet( '2013-03-26 00:00' ) ],
 [ 15,  irl, [], aut, Time.cet( '2013-03-26 00:00' ) ]]

games_world4 = [
 [ 16,  irl, [], far, Time.cet( '2013-06-07 00:00' ) ],
 [ 17,  aut, [], swe, Time.cet( '2013-06-07 00:00' ) ],
 [ 18,  swe, [], far, Time.cet( '2013-06-11 00:00' ) ]]

games_world5 = [
 [ 19,  ger, [], aut, Time.cet( '2013-09-06 00:00' ) ],
 [ 20,  kaz, [], far, Time.cet( '2013-09-06 00:00' ) ],
 [ 21,  irl, [], swe, Time.cet( '2013-09-06 00:00' ) ],
 [ 22,  far, [], ger, Time.cet( '2013-09-10 00:00' ) ],
 [ 23,  aut, [], irl, Time.cet( '2013-09-10 00:00' ) ],
 [ 24,  kaz, [], swe, Time.cet( '2013-09-10 00:00' ) ]]

games_world6 = [
 [ 25,  ger, [], irl, Time.cet( '2013-10-11 00:00' ) ],
 [ 26,  far, [], kaz, Time.cet( '2013-10-11 00:00' ) ],
 [ 27,  swe, [], aut, Time.cet( '2013-10-11 00:00' ) ],
 [ 28,  swe, [], ger, Time.cet( '2013-10-15 00:00' ) ],
 [ 29,  far, [], aut, Time.cet( '2013-10-15 00:00' ) ],
 [ 30,  irl, [], kaz, Time.cet( '2013-10-15 00:00' ) ]]


Game.create_from_ary!( games_world1, world1 )
Game.create_from_ary!( games_world2, world2 )
Game.create_from_ary!( games_world3, world3 )
Game.create_from_ary!( games_world4, world4 )
Game.create_from_ary!( games_world5, world5 )
Game.create_from_ary!( games_world6, world6 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.world.quali.version', :value => '1' )