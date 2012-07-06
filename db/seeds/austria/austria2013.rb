# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


puts "*** loading seed data in seeds/austria2013.rb"

######################################
## Oesterreichische Bundesliga 2012
##
## more info => http://bundesliga.at

bl = Event.create!( :title => 'Österr. Bundesliga 2013', :key => 'bl', :start_at => Time.cet('2012-07-21 16:00'))

salzburg    = Team.create!( :title => 'FC RB Salzburg',      :tag => 'RBS',  :key => 'salzburg',    :img => 'at/salzburg.png' )
rapid       = Team.create!( :title => 'SK Rapid Wien',       :tag => 'RAP',  :key => 'rapid',       :img => 'at/rapid.png' )
admira      = Team.create!( :title => 'FC Admira',           :tag => 'ADM',  :key => 'admira',      :img => 'at/admira.png' )
austria     = Team.create!( :title => 'FK Austria Wien',     :tag => 'FAK',  :key => 'austria',     :img => 'at/austria.png' )
sturm       = Team.create!( :title => 'SK Sturm Graz',       :tag => 'STU',  :key => 'sturm',       :img => 'at/sturm.png' )
ried        = Team.create!( :title => 'SV Ried',             :tag => 'RIED', :key => 'ried',        :img => 'at/ried.png' )
wacker      = Team.create!( :title => 'FC Wacker Innsbruck', :tag => 'IBK',  :key => 'wacker',      :img => 'at/wacker.png' )
mattersburg = Team.create!( :title => 'SV Mattersburg',      :tag => 'SVM',  :key => 'mattersburg', :img => 'at/mattersburg.png' )
neustadt    = Team.create!( :title => 'SC Wiener Neustadt',  :tag => 'WRN',  :key => 'neustadt',    :img => 'at/neustadt.png' )
wac         = Team.create!( :title => 'WAC',                 :tag => 'WAC',  :key => 'wac',         :img => 'at/wac.png' )

## absteiger 2011/2012
# ksv         = Team.create!( :title => 'KSV 1919',            :tag => 'KSV',  :key => 'ksv',         :img => 'ksv.png' )

bl.teams << salzburg
bl.teams << rapid
bl.teams << admira
bl.teams << austria
bl.teams << sturm
bl.teams << ried
bl.teams << wacker
bl.teams << mattersburg
bl.teams << neustadt
bl.teams << wac


bl01 = Round.create!( :event => bl, :pos =>  1, :title => '1. Runde', :title2 => '21.+22. Jul 2012' )
bl02 = Round.create!( :event => bl, :pos =>  2, :title => '2. Runde', :title2 => '28.+29. Jul 2012' )
bl03 = Round.create!( :event => bl, :pos =>  3, :title => '3. Runde', :title2 => '4.+5. Aug 2012' )
bl04 = Round.create!( :event => bl, :pos =>  4, :title => '4. Runde', :title2 => '11. Aug 2012' )
bl05 = Round.create!( :event => bl, :pos =>  5, :title => '5. Runde', :title2 => '18. Aug 2012' )
bl06 = Round.create!( :event => bl, :pos =>  6, :title => '6. Runde', :title2 => '25. Aug 2012' )
bl07 = Round.create!( :event => bl, :pos =>  7, :title => '7. Runde', :title2 => '1. Sep 2012' )
bl08 = Round.create!( :event => bl, :pos =>  8, :title => '8. Runde', :title2 => '15. Sep 2012' )
bl09 = Round.create!( :event => bl, :pos =>  9, :title => '9. Runde', :title2 => '22. Sep 2012' )
bl10 = Round.create!( :event => bl, :pos => 10, :title => '10. Runde', :title2 => '29. Sep 2012' )
bl11 = Round.create!( :event => bl, :pos => 11, :title => '11. Runde', :title2 => '6. Okt 2012' )
bl12 = Round.create!( :event => bl, :pos => 12, :title => '12. Runde', :title2 => '20. Okt 2012' )
bl13 = Round.create!( :event => bl, :pos => 13, :title => '13. Runde', :title2 => '27. Okt 2012' )
bl14 = Round.create!( :event => bl, :pos => 14, :title => '14. Runde', :title2 => '3. Nov 2012' )
bl15 = Round.create!( :event => bl, :pos => 15, :title => '15. Runde', :title2 => '10. Nov 2012' )
bl16 = Round.create!( :event => bl, :pos => 16, :title => '16. Runde', :title2 => '17. Nov 2012' )
bl17 = Round.create!( :event => bl, :pos => 17, :title => '17. Runde', :title2 => '24. Nov 2012' )
bl18 = Round.create!( :event => bl, :pos => 18, :title => '18. Runde', :title2 => '1. Dez 2012' )


games_bl01 = [
  [ 1, sturm,       [], salzburg,  Time.cet('2012-07-21 16:00') ],
  [ 2, rapid,       [], wacker,    Time.cet('2012-07-21 18:30') ],
  [ 3, mattersburg, [], neustadt,  Time.cet('2012-07-21 18:30') ],
  [ 4, wac,         [], austria,   Time.cet('2012-07-21 18:30') ],
  [ 5, admira,      [], ried,      Time.cet('2012-07-22 16:00') ]
]

games_bl02 = [
  [ 1, neustadt,    [], rapid,       Time.cet('2012-07-28 18:30') ],
  [ 2, salzburg,    [], mattersburg, Time.cet('2012-07-28 18:30') ],
  [ 3, austria,     [], sturm,       Time.cet('2012-07-28 18:30') ],
  [ 4, wacker,      [], admira,      Time.cet('2012-07-29 16:00') ],
  [ 5, ried,        [], wac,         Time.cet('2012-07-29 18:30') ]
]


Game.create_from_ary!( games_bl01, bl01 )
Game.create_from_ary!( games_bl02, bl02 )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.2013.version', :value => '1' )
