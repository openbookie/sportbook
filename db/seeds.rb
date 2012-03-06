# encoding: utf-8

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012

# todo: check dates and times (timezones?? +2 +3??)


# add score colum to game??

#################################3
# Gruppe A

Team.create!( :id =>  1, :title => 'Polen',        :img => 'poland2.png' )
Team.create!( :id =>  2, :title => 'Griechenland', :img => 'greece2.png' )
Team.create!( :id =>  3, :title => 'Russland',     :img => 'russia2.png' )
Team.create!( :id =>  4, :title => 'Tschechien',   :img => 'czech_republic2.png' )

GameGroup.create!( :id => 1, :title => 'Gruppe A' )

Game.create!( :id=> 1, :game_group_id=>1, :team1_id=>1, :team2_id=>2, :play_at => '2012-06-08 18:00' )
Game.create!( :id=> 2, :game_group_id=>1, :team1_id=>3, :team2_id=>4, :play_at => '2012-06-08 20:45' )

Game.create!( :id=> 9, :game_group_id=>1, :team1_id=>2, :team2_id=>4, :play_at => '2012-06-12 18:00' )
Game.create!( :id=>10, :game_group_id=>1, :team1_id=>1, :team2_id=>3, :play_at => '2012-06-12 20:45' )

Game.create!( :id=>17, :game_group_id=>1, :team1_id=>2, :team2_id=>3, :play_at => '2012-06-16 20:45' )
Game.create!( :id=>18, :game_group_id=>1, :team1_id=>4, :team2_id=>1, :play_at => '2012-06-16 20:45' )


#################################3
# Gruppe B

Team.create!( :id =>  5, :title => 'Niederlande', :img => 'netherlands2.png' )
Team.create!( :id =>  6, :title => 'Dänemark',    :img => 'denmark2.png' )
Team.create!( :id =>  7, :title => 'Deutschland', :img => 'germany2.png' )
Team.create!( :id =>  8, :title => 'Portugal',    :img => 'portugal2.png' )

GameGroup.create!( :id => 2, :title => 'Gruppe B' )

Game.create!( :id=>  3, :game_group_id=>2, :team1_id=> 5, :team2_id=>6, :play_at => '2012-06-09 18:00' )
Game.create!( :id=>  4, :game_group_id=>2, :team1_id=> 7, :team2_id=>8, :play_at => '2012-06-09 20:45' )

Game.create!( :id=> 11, :game_group_id=>2, :team1_id=> 6, :team2_id=>8, :play_at => '2012-06-13 18:00' )
Game.create!( :id=> 12, :game_group_id=>2, :team1_id=> 5, :team2_id=>7, :play_at => '2012-06-13 20:45' )

Game.create!( :id=> 19, :game_group_id=>2, :team1_id=> 8, :team2_id=>5, :play_at => '2012-06-17 20:45' )
Game.create!( :id=> 20, :game_group_id=>2, :team1_id=> 6, :team2_id=>7, :play_at => '2012-06-17 20:45' )


#################################3
# Gruppe C

Team.create!( :id =>  9, :title => 'Spanien',   :img => 'spain2.png' )
Team.create!( :id => 10, :title => 'Italien',   :img => 'italy2.png' )
Team.create!( :id => 11, :title => 'Irland',    :img => 'ireland2.png' )
Team.create!( :id => 12, :title => 'Kroatien',  :img => 'croatia2.png' )

GameGroup.create!( :id => 3, :title => 'Gruppe C' )

Game.create!( :id=>  5, :game_group_id=>3, :team1_id=> 9, :team2_id=>10, :play_at => '2012-06-10 18:00' )
Game.create!( :id=>  6, :game_group_id=>3, :team1_id=> 11, :team2_id=>12, :play_at => '2012-06-10 20:45' )

Game.create!( :id=> 13, :game_group_id=>3, :team1_id=> 10, :team2_id=>12, :play_at => '2012-06-14 18:00' )
Game.create!( :id=> 14, :game_group_id=>3, :team1_id=>  9, :team2_id=>11, :play_at => '2012-06-14 20:45' )

Game.create!( :id=> 21, :game_group_id=>3, :team1_id=> 12, :team2_id=>9, :play_at => '2012-06-18 20:45' )
Game.create!( :id=> 22, :game_group_id=>3, :team1_id=> 10, :team2_id=>11, :play_at => '2012-06-18 20:45' )


#################################3
# Gruppe D

Team.create!( :id => 13, :title => 'Ukraine',     :img => 'ukraine2.png' )
Team.create!( :id => 14, :title => 'Schweden',    :img => 'sweden2.png' )
Team.create!( :id => 15, :title => 'Frankreich',  :img => 'france2.png' )
Team.create!( :id => 16, :title => 'England',     :img => 'england2.png' )

GameGroup.create!( :id => 4, :title => 'Gruppe D' )

Game.create!( :id=>  7, :game_group_id=>4, :team1_id=> 15, :team2_id=>16, :play_at => '2012-06-11 19:00' )
Game.create!( :id=>  8, :game_group_id=>4, :team1_id=> 13, :team2_id=>14, :play_at => '2012-06-11 20:45' )

Game.create!( :id=> 16, :game_group_id=>4, :team1_id=> 13, :team2_id=>15, :play_at => '2012-06-15 19:00' )
Game.create!( :id=> 15, :game_group_id=>4, :team1_id=> 14, :team2_id=>16, :play_at => '2012-06-15 21:45' )

Game.create!( :id=> 23, :game_group_id=>4, :team1_id=> 16, :team2_id=>13, :play_at => '2012-06-19 21:45' )
Game.create!( :id=> 24, :game_group_id=>4, :team1_id=> 14, :team2_id=>15, :play_at => '2012-06-19 21:45' )


################################################################
# Viertelfinale

Team.create!( :id => 20, :title => '1. Gruppe A' )
Team.create!( :id => 21, :title => '2. Gruppe A' )

Team.create!( :id => 22, :title => '1. Gruppe B' )
Team.create!( :id => 23, :title => '2. Gruppe B' )

Team.create!( :id => 24, :title => '1. Gruppe C' )
Team.create!( :id => 25, :title => '2. Gruppe C' )

Team.create!( :id => 26, :title => '1. Gruppe D' )
Team.create!( :id => 27, :title => '2. Gruppe D' )

GameGroup.create!( :id => 5, :title => 'Viertelfinale' )

Game.create!( :id=>  25, :game_group_id=>5, :team1_id=> 20, :team2_id=>23, :play_at => '2012-06-21 20:45' )
Game.create!( :id=>  26, :game_group_id=>5, :team1_id=> 22, :team2_id=>21, :play_at => '2012-06-22 20:45' )
Game.create!( :id=>  27, :game_group_id=>5, :team1_id=> 24, :team2_id=>27, :play_at => '2012-06-23 21:45' )
Game.create!( :id=>  28, :game_group_id=>5, :team1_id=> 26, :team2_id=>25, :play_at => '2012-06-24 21:45' )

##############################################
# Halbfinale

Team.create!( :id => 30, :title => 'Sieger Viertelfinale 1' )  # Sieger Spiel 25
Team.create!( :id => 31, :title => 'Sieger Viertelfinale 2' )  # Sieger Spiel 26
Team.create!( :id => 32, :title => 'Sieger Viertelfinale 3' )  # Sieger Spiel 27
Team.create!( :id => 33, :title => 'Sieger Viertelfinale 4' )  # Sieger Spiel 28

GameGroup.create!( :id => 6, :title => 'Halbfinale' )

Game.create!( :id=>  29, :game_group_id=>6, :team1_id=> 30, :team2_id=>32, :play_at => '2012-06-27 21:45' )
Game.create!( :id=>  30, :game_group_id=>6, :team1_id=> 31, :team2_id=>33, :play_at => '2012-06-28 20:45' )


################################################
# Finale

Team.create!( :id => 40, :title => 'Sieger Halbfinale 1' )  # Sieger Spiel 29
Team.create!( :id => 41, :title => 'Sieger Halbfinale 2' )  # Sieger Spiel 30

GameGroup.create!( :id => 7, :title => 'Finale' )

Game.create!( :id=>  31, :game_group_id=>7, :team1_id=> 40, :team2_id=>41, :play_at => '2012-07-01 21:45' )


##############
##  Pools und Users

user1 = User.create!( :name => 'Behrooz SEIFI', :email => 'behrooz' )
user2 = User.create!( :name => 'Gerald BAUER', :email => 'gerald' )
user3 = User.create!( :name => 'Gürsel AYAZ', :email => 'gürsel'  )
user4 = User.create!( :name => 'Richard TRAINDL', :email => 'richard' )
user5 = User.create!( :name => 'Manfred KOPECEK', :email => 'manfred' )


pool1 = Pool.create!( :title => 'Euro 2012 Fix', :user => user1 )
pool2 = Pool.create!( :title => 'Euro 2012 Flex', :user => user1 )


pool1.players << user1  # also add amin first
pool1.players << user2
pool1.players << user3
pool1.players << user4
pool1.players << user5


Tip.create!( :user => user2, :pool => pool1, :game_id => 1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => user2, :pool => pool1, :game_id => 2, :score1 => 1, :score2 => 4 )
Tip.create!( :user => user2, :pool => pool1, :game_id => 10, :score1 => 3, :score2 => 1 )
Tip.create!( :user => user2, :pool => pool1, :game_id => 7, :score1 => 0, :score2 => 2 )


Tip.create!( :user => user3, :pool => pool1, :game_id => 1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => user3, :pool => pool1, :game_id => 2, :score1 => 1, :score2 => 4 )

