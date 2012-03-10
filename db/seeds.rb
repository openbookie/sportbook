# encoding: utf-8

# see http://en.wikipedia.org/wiki/UEFA_Euro_2012
# or  http://de.wikipedia.org/wiki/Fu%C3%9Fball-Europameisterschaft_2012


# note: timezone for games (play_at) is CET (central european time)


e2 = Event.create!( :title => 'Champions League 2012' )

t100 = Team.create!( :title => 'FC Internazionale Milano', :img => 'internazionale.png' )
t101 = Team.create!( :title => 'Olympique Marseille', :img => 'marseille.png' )
t102 = Team.create!( :title => 'FC Bayern München', :img => 'bayern.png' )
t103 = Team.create!( :title => 'FC Basel 1893', :img => 'basel.png' )

t104 = Team.create!( :title => 'Chelsea FC', :img => 'chelsea.png' )
t105 = Team.create!( :title => 'SSC Napoli',  :img => 'napoli.png')
t106 = Team.create!( :title => 'Real Madrid CF', :img => 'madrid.png' )
t107 = Team.create!( :title => 'PFC CSKA Moskva', :img => 'moskva.png' )

# fix: change pos to 1

group99 = GameGroup.create!( :event => e2, :pos => 0, :title => 'Achtelfinale' )

g90 = Game.create!( :pos=>1, :game_group=>group99, :team1=>t107, :team2=>t106, :play_at => '2012-02-21 20:45', :score1 => 1, :score2 => 1 )
g91 = Game.create!( :pos=>2, :game_group=>group99, :team1=>t105, :team2=>t104, :play_at => '2012-02-21 20:45', :score1 => 3, :score2 => 1 )

g92 = Game.create!( :pos=>3, :game_group=>group99, :team1=>t101, :team2=>t100, :play_at => '2012-02-22 20:45', :score1 => 1, :score2 => 0 )
g93 = Game.create!( :pos=>4, :game_group=>group99, :team1=>t103, :team2=>t102, :play_at => '2012-02-22 20:45', :score1 => 1, :score2 => 0 )


# fix: change pos to 2 (or fold rueckspiele into achtelfinale)

group100 = GameGroup.create!( :event => e2, :pos => 1, :title => 'Achtelfinale Rückspiele' )

g100 = Game.create!( :pos=>1, :game_group=>group100, :team1=>t100, :team2=>t101, :play_at => '2012-03-13 20:45' )
g101 = Game.create!( :pos=>2, :game_group=>group100, :team1=>t102, :team2=>t103, :play_at => '2012-03-13 20:45' )

g102 = Game.create!( :pos=>3, :game_group=>group100, :team1=>t104, :team2=>t105, :play_at => '2012-03-14 20:45' )
g103 = Game.create!( :pos=>4, :game_group=>group100, :team1=>t106, :team2=>t107, :play_at => '2012-03-14 20:45' )


#################################
### Euro 2012

e1 = Event.create!( :title => 'Euro 2012' )

#################################3
# Gruppe A

t1 = Team.create!( :title => 'Polen',        :img => 'poland2.png' )
t2 = Team.create!( :title => 'Griechenland', :img => 'greece2.png' )
t3 = Team.create!( :title => 'Russland',     :img => 'russia2.png' )
t4 = Team.create!( :title => 'Tschechien',   :img => 'czech_republic2.png' )

group1 = GameGroup.create!( :event => e1, :pos => 1, :title => 'Gruppe A' )

g1  = Game.create!( :pos=> 1, :game_group=>group1, :team1=>t1, :team2=>t2, :play_at => '2012-06-08 18:00', :score1=>1, :score2=>2 )
g2  = Game.create!( :pos=> 2, :game_group=>group1, :team1=>t3, :team2=>t4, :play_at => '2012-06-08 20:45', :score1=>0, :score2=>0 )

g9  = Game.create!( :pos=> 9, :game_group=>group1, :team1=>t2, :team2=>t4, :play_at => '2012-06-12 18:00', :score1=>2, :score2=>3 )
g10 = Game.create!( :pos=>10, :game_group=>group1, :team1=>t1, :team2=>t3, :play_at => '2012-06-12 20:45', :score1=>2, :score2=>1 )

g17 = Game.create!( :pos=>17, :game_group=>group1, :team1=>t2, :team2=>t3, :play_at => '2012-06-16 20:45', :score1=>4, :score2=>1 )
g18 = Game.create!( :pos=>18, :game_group=>group1, :team1=>t4, :team2=>t1, :play_at => '2012-06-16 20:45', :score1=>2, :score2=>0 )


#################################3
# Gruppe B

t5 = Team.create!( :title => 'Niederlande', :img => 'netherlands2.png' )
t6 = Team.create!( :title => 'Dänemark',    :img => 'denmark2.png' )
t7 = Team.create!( :title => 'Deutschland', :img => 'germany2.png' )
t8 = Team.create!( :title => 'Portugal',    :img => 'portugal2.png' )

group2 = GameGroup.create!( :event => e1, :pos => 2, :title => 'Gruppe B' )

g3  = Game.create!( :pos=>  3, :game_group=>group2, :team1=>t5, :team2=>t6, :play_at => '2012-06-09 18:00' )
g4  = Game.create!( :pos=>  4, :game_group=>group2, :team1=>t7, :team2=>t8, :play_at => '2012-06-09 20:45' )

g11 = Game.create!( :pos=> 11, :game_group=>group2, :team1=>t6, :team2=>t8, :play_at => '2012-06-13 18:00' )
g12 = Game.create!( :pos=> 12, :game_group=>group2, :team1=>t5, :team2=>t7, :play_at => '2012-06-13 20:45' )

g19 = Game.create!( :pos=> 19, :game_group=>group2, :team1=>t8, :team2=>t5, :play_at => '2012-06-17 20:45' )
g20 = Game.create!( :pos=> 20, :game_group=>group2, :team1=>t6, :team2=>t7, :play_at => '2012-06-17 20:45' )


#################################3
# Gruppe C

t9  = Team.create!( :title => 'Spanien',   :img => 'spain2.png' )
t10 = Team.create!( :title => 'Italien',   :img => 'italy2.png' )
t11 = Team.create!( :title => 'Irland',    :img => 'ireland2.png' )
t12 = Team.create!( :title => 'Kroatien',  :img => 'croatia2.png' )

group3 = GameGroup.create!( :event => e1, :pos => 3, :title => 'Gruppe C' )

g5 = Game.create!( :pos=>  5, :game_group=>group3, :team1=>t9,  :team2=>t10, :play_at => '2012-06-10 18:00' )
g6 = Game.create!( :pos=>  6, :game_group=>group3, :team1=>t11, :team2=>t12, :play_at => '2012-06-10 20:45' )

g13 = Game.create!( :pos=> 13, :game_group=>group3, :team1=>t10, :team2=>t12, :play_at => '2012-06-14 18:00' )
g14 = Game.create!( :pos=> 14, :game_group=>group3, :team1=>t9,  :team2=>t11, :play_at => '2012-06-14 20:45' )

g21 = Game.create!( :pos=> 21, :game_group=>group3, :team1=>t12, :team2=>t9,  :play_at => '2012-06-18 20:45' )
g22 = Game.create!( :pos=> 22, :game_group=>group3, :team1=>t10, :team2=>t11, :play_at => '2012-06-18 20:45' )


#################################3
# Gruppe D

t13 = Team.create!( :title => 'Ukraine',     :img => 'ukraine2.png' )
t14 = Team.create!( :title => 'Schweden',    :img => 'sweden2.png' )
t15 = Team.create!( :title => 'Frankreich',  :img => 'france2.png' )
t16 = Team.create!( :title => 'England',     :img => 'england2.png' )

group4 = GameGroup.create!( :event => e1, :pos => 4, :title => 'Gruppe D' )

g7 = Game.create!( :pos=>  7, :game_group=>group4, :team1=>t15, :team2=>t16, :play_at => '2012-06-11 18:00' )
g8 = Game.create!( :pos=>  8, :game_group=>group4, :team1=>t13, :team2=>t14, :play_at => '2012-06-11 20:45' )

g16 = Game.create!( :pos=> 16, :game_group=>group4, :team1=>t13, :team2=>t15, :play_at => '2012-06-15 18:00' )
g15 = Game.create!( :pos=> 15, :game_group=>group4, :team1=>t14, :team2=>t16, :play_at => '2012-06-15 20:45' )

g23 = Game.create!( :pos=> 23, :game_group=>group4, :team1=>t16, :team2=>t13, :play_at => '2012-06-19 20:45' )
g24 = Game.create!( :pos=> 24, :game_group=>group4, :team1=>t14, :team2=>t15, :play_at => '2012-06-19 20:45' )


################################################################
# Viertelfinale

t20 = Team.create!( :title => '1. Gruppe A', :calc => true )
t21 = Team.create!( :title => '2. Gruppe A', :calc => true )

t22 = Team.create!( :title => '1. Gruppe B', :calc => true )
t23 = Team.create!( :title => '2. Gruppe B', :calc => true )

t24 = Team.create!( :title => '1. Gruppe C', :calc => true )
t25 = Team.create!( :title => '2. Gruppe C', :calc => true )

t26 = Team.create!( :title => '1. Gruppe D', :calc => true )
t27 = Team.create!( :title => '2. Gruppe D', :calc => true )

group5 = GameGroup.create!( :event => e1, :pos => 5, :title => 'Viertelfinale' )

g25 = Game.create!( :pos=> 25, :game_group=>group5, :team1=>t20, :team2=>t23, :play_at => '2012-06-21 20:45' )
g26 = Game.create!( :pos=> 26, :game_group=>group5, :team1=>t22, :team2=>t21, :play_at => '2012-06-22 20:45' )
g27 = Game.create!( :pos=> 27, :game_group=>group5, :team1=>t24, :team2=>t27, :play_at => '2012-06-23 20:45' )
g28 = Game.create!( :pos=> 28, :game_group=>group5, :team1=>t26, :team2=>t25, :play_at => '2012-06-24 20:45' )

##############################################
# Halbfinale

t30 = Team.create!( :title => 'Sieger Viertelfinale 1', :calc => true )  # Sieger Spiel 25
t31 = Team.create!( :title => 'Sieger Viertelfinale 2', :calc => true )  # Sieger Spiel 26
t32 = Team.create!( :title => 'Sieger Viertelfinale 3', :calc => true )  # Sieger Spiel 27
t33 = Team.create!( :title => 'Sieger Viertelfinale 4', :calc => true )  # Sieger Spiel 28

group6 = GameGroup.create!( :event => e1, :pos => 6, :title => 'Halbfinale' )

g29 = Game.create!( :pos=> 29, :game_group=>group6, :team1=>t30, :team2=>t32, :play_at => '2012-06-27 20:45' )
g30 = Game.create!( :pos=> 30, :game_group=>group6, :team1=>t31, :team2=>t33, :play_at => '2012-06-28 20:45' )


################################################
# Finale

t40 = Team.create!( :title => 'Sieger Halbfinale 1', :calc => true )  # Sieger Spiel 29
t41 = Team.create!( :title => 'Sieger Halbfinale 2', :calc => true )  # Sieger Spiel 30

group7 = GameGroup.create!( :event => e1, :pos => 7, :title => 'Finale' )

g31 = Game.create!( :pos=> 31, :game_group=>group7, :team1=>t40, :team2=>t41, :play_at => '2012-07-01 20:45' )


##############
##  Pools und Users

user1  = User.create!( :name => 'Behrooz SEIFI', :email => 'behrooz' )
user2  = User.create!( :name => 'Gerald BAUER', :email => 'gerald' )
user3  = User.create!( :name => 'Gürsel AYAZ', :email => 'gürsel'  )
user4  = User.create!( :name => 'Richard TRAINDL', :email => 'richard' )
user5  = User.create!( :name => 'Manfred KOPECEK', :email => 'manfred' )
user6  = User.create!( :name => 'Clemens HUBER', :email => 'clemens' )
user7  = User.create!( :name => 'Franz BAUER', :email => 'franz' )
user8  = User.create!( :name => 'Andy SCHEIBELHOFER', :email => 'andy' )
user9  = User.create!( :name => 'Thomas SCHOLZ', :email => 'thomas' )
user10 = User.create!( :name => 'Dietmar BAYERL', :email => 'dietmar' )
user11 = User.create!( :name => 'Harry PIETSCHMANN', :email => 'harry' )

pool1 = Pool.create!( :event => e1, :title => 'UNIQA Fix', :user => user1, :welcome => 'Alles ist fix. Letzte Änderungen möglich Freitag, 8. Juni 6 Uhr abends d.h. bei Anpfiff des Eröffnungspiels.' )
pool2 = Pool.create!( :event => e1, :title => 'UNIQA Flex', :user => user1, :welcome => 'Nix is fix. Änderung bis vor Spielanpfiff möglich.' )
pool3 = Pool.create!( :event => e2, :title => 'UNIQA Test', :user => user1, :welcome => '' )

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

Tip.create!( :user => user2, :pool => pool1, :game => g1,  :score1 => 2, :score2 => 3 )
Tip.create!( :user => user2, :pool => pool1, :game => g2,  :score1 => 1, :score2 => 4 )
Tip.create!( :user => user2, :pool => pool1, :game => g10, :score1 => 3, :score2 => 1 )
Tip.create!( :user => user2, :pool => pool1, :game => g7,  :score1 => 0, :score2 => 2 )


Tip.create!( :user => user3, :pool => pool1, :game => g1, :score1 => 2, :score2 => 3 )
Tip.create!( :user => user3, :pool => pool1, :game => g2, :score1 => 1, :score2 => 4 )
