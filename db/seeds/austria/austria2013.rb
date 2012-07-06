# encoding: utf-8

# note: timezone for games (play_at) is *always* CET (central european time)


puts "*** loading seed data in seeds/austria2013.rb"

######################################
## Oesterreichische Bundesliga 2012
##
## more info => http://bundesliga.at

bl = Event.create!( :title => 'Österr. Bundesliga 2012/13', :key => 'bl', :start_at => Time.cet('2012-07-21 00:00'))

salzburg    = Team.create!( :title => 'FC RB Salzburg',      :tag => 'RBS',  :key => 'salzburg',    :img => 'at/salzburg.png' )
rapid       = Team.create!( :title => 'SK Rapid Wien',       :tag => 'RAP',  :key => 'rapid',       :img => 'at/rapid.png' )
admira      = Team.create!( :title => 'FC Admira',           :tag => 'ADM',  :key => 'admira',      :img => 'at/admira.png' )
austria     = Team.create!( :title => 'FK Austria Wien',     :tag => 'FAK',  :key => 'austria',     :img => 'at/austria.png' )
sturm       = Team.create!( :title => 'SK Sturm Graz',       :tag => 'STU',  :key => 'sturm',       :img => 'at/sturm.png' )
ried        = Team.create!( :title => 'SV Ried',             :tag => 'RIED', :key => 'ried',        :img => 'at/ried.png' )
wacker      = Team.create!( :title => 'FC Wacker Innsbruck', :tag => 'IBK',  :key => 'wacker',      :img => 'at/wacker.png' )
mattersburg = Team.create!( :title => 'SV Mattersburg',      :tag => 'SVM',  :key => 'mattersburg', :img => 'at/mattersburg.png' )
neustadt    = Team.create!( :title => 'SC Wiener Neustadt',  :tag => 'WRN',  :key => 'neustadt',    :img => 'at/neustadt.png' )
wac         = Team.create!( :title => 'Wolfsburger AC',      :tag => 'WAC',  :key => 'wac',         :img => 'at/wac.png' )

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
bl19 = Round.create!( :event => bl, :pos => 19, :title => '19. Runde', :title2 => '8. Dez 2012' )
bl20 = Round.create!( :event => bl, :pos => 20, :title => '20. Runde', :title2 => '15. Dez 2012' )


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

games_bl03 = [
  [ 1, ried,        [], wacker,       Time.cet('2012-08-04 18:30') ],
  [ 2, mattersburg, [], sturm,        Time.cet('2012-08-04 18:30') ],
  [ 3, wac,         [], salzburg,     Time.cet('2012-08-04 18:30') ],
  [ 4, admira,      [], neustadt,     Time.cet('2012-08-04 18:30') ],
  [ 5, rapid,       [], austria,      Time.cet('2012-08-05 16:00') ]
]

games_bl04 = [
  [ 1, neustadt,    [], ried,        Time.cet('2012-08-11 00:00') ],
  [ 2, sturm,       [], wac,         Time.cet('2012-08-11 00:00') ],
  [ 3, salzburg,    [], rapid,       Time.cet('2012-08-11 00:00') ],
  [ 4, austria,     [], admira,      Time.cet('2012-08-11 00:00') ],
  [ 5, wacker,      [], mattersburg, Time.cet('2012-08-11 00:00') ]
]

games_bl05 = [
  [ 1, ried,     [], austria,       Time.cet('2012-08-18 00:00') ],
  [ 2, rapid,    [], sturm,         Time.cet('2012-08-18 00:00') ],
  [ 3, wacker,   [], neustadt,      Time.cet('2012-08-18 00:00') ],
  [ 4, wac,      [], mattersburg,   Time.cet('2012-08-18 00:00') ],
  [ 5, admira,   [], salzburg,      Time.cet('2012-08-18 00:00') ]
]

games_bl06 = [
  [ 1, sturm,       [], admira,       Time.cet('2012-08-25 00:00') ],
  [ 2, salzburg,    [], neustadt,     Time.cet('2012-08-25 00:00') ],
  [ 3, austria,     [], wacker,       Time.cet('2012-08-25 00:00') ],
  [ 4, mattersburg, [], ried,         Time.cet('2012-08-25 00:00') ],
  [ 5, wac,         [], rapid,        Time.cet('2012-08-25 00:00') ]
]

games_bl07 = [
  [ 1, ried,    [], sturm,       Time.cet('2012-09-01 00:00') ],
  [ 2, neustadt,[], austria,     Time.cet('2012-09-01 00:00') ],
  [ 3, rapid,   [], mattersburg, Time.cet('2012-09-01 00:00') ],
  [ 4, wacker,  [], salzburg,    Time.cet('2012-09-01 00:00') ],
  [ 5, admira,  [], wac,         Time.cet('2012-09-01 00:00') ]
]

games_bl08 = [
  [ 1, sturm,       [], wacker,       Time.cet('2012-09-15 00:00') ],
  [ 2, salzburg,    [], ried,         Time.cet('2012-09-15 00:00') ],
  [ 3, rapid,       [], admira,       Time.cet('2012-09-15 00:00') ],
  [ 4, mattersburg, [], austria,      Time.cet('2012-09-15 00:00') ],
  [ 5, wac,         [], neustadt,     Time.cet('2012-09-15 00:00') ]
]

games_bl09 = [
  [ 1, ried,    [], rapid,       Time.cet('2012-09-22 00:00') ],
  [ 2, neustadt,[], sturm,       Time.cet('2012-09-22 00:00') ],
  [ 3, austria, [], salzburg,    Time.cet('2012-09-22 00:00') ],
  [ 4, wacker,  [], wac,         Time.cet('2012-09-22 00:00') ],
  [ 5, admira,  [], mattersburg, Time.cet('2012-09-22 00:00') ]
]

games_bl10 = [
  [ 1, salzburg,  [], sturm,       Time.cet('2012-09-29 00:00') ],
  [ 2, wacker,    [], rapid,       Time.cet('2012-09-29 00:00') ],
  [ 3, neustadt,  [], mattersburg, Time.cet('2012-09-29 00:00') ],
  [ 4, austria,   [], wac,         Time.cet('2012-09-29 00:00') ],
  [ 5, ried,      [], admira,      Time.cet('2012-09-29 00:00') ]
]

games_bl11 = [
  [ 1, wac,         [], ried,       Time.cet('2012-10-06 00:00') ],
  [ 2, rapid,       [], neustadt,   Time.cet('2012-10-06 00:00') ],
  [ 3, mattersburg, [], salzburg,   Time.cet('2012-10-06 00:00') ],
  [ 4, sturm,       [], austria,    Time.cet('2012-10-06 00:00') ],
  [ 5, admira,      [], wacker,     Time.cet('2012-10-06 00:00') ]
]

games_bl12 = [
  [ 1, wacker,    [], ried,        Time.cet('2012-10-20 00:00') ],
  [ 2, austria,   [], rapid,       Time.cet('2012-10-20 00:00') ],
  [ 3, sturm,     [], mattersburg, Time.cet('2012-10-20 00:00') ],
  [ 4, salzburg,  [], wac,         Time.cet('2012-10-20 00:00') ],
  [ 5, neustadt,  [], admira,      Time.cet('2012-10-20 00:00') ]
]

games_bl13 = [
  [ 1, ried,        [], neustadt,     Time.cet('2012-10-27 00:00') ],
  [ 2, wac,         [], sturm,        Time.cet('2012-10-27 00:00') ],
  [ 3, rapid,       [], salzburg,     Time.cet('2012-10-27 00:00') ],
  [ 4, admira,      [], austria,      Time.cet('2012-10-27 00:00') ],
  [ 5, mattersburg, [], wacker,       Time.cet('2012-10-27 00:00') ]
]

games_bl14 = [
  [ 1, austria,      [], ried,     Time.cet('2012-11-03 00:00') ],
  [ 2, sturm,        [], rapid,    Time.cet('2012-11-03 00:00') ],
  [ 3, neustadt,     [], wacker,   Time.cet('2012-11-03 00:00') ],
  [ 4, mattersburg,  [], wac,      Time.cet('2012-11-03 00:00') ],
  [ 5, salzburg,     [], admira,   Time.cet('2012-11-03 00:00') ]
]

games_bl15 = [
  [ 1, admira,      [], sturm,       Time.cet('2012-11-10 00:00') ],
  [ 2, neustadt,    [], salzburg,    Time.cet('2012-11-10 00:00') ],
  [ 3, wacker,      [], austria,     Time.cet('2012-11-10 00:00') ],
  [ 4, ried,        [], mattersburg, Time.cet('2012-11-10 00:00') ],
  [ 5, rapid,       [], wac,         Time.cet('2012-11-10 00:00') ]
]

games_bl16 = [
  [ 1, sturm,      [], ried,        Time.cet('2012-11-17 00:00') ],
  [ 2, austria,    [], neustadt,    Time.cet('2012-11-17 00:00') ],
  [ 3, mattersburg,[], rapid,       Time.cet('2012-11-17 00:00') ],
  [ 4, salzburg,   [], wacker,      Time.cet('2012-11-17 00:00') ],
  [ 5, wac,        [], admira,      Time.cet('2012-11-17 00:00') ]
]

games_bl17 = [
  [ 1, wacker,    [], sturm,       Time.cet('2012-11-24 00:00') ],
  [ 2, ried,      [], salzburg,    Time.cet('2012-11-24 00:00') ],
  [ 3, admira,    [], rapid,       Time.cet('2012-11-24 00:00') ],
  [ 4, austria,   [], mattersburg, Time.cet('2012-11-24 00:00') ],
  [ 5, neustadt,  [], wac,         Time.cet('2012-11-24 00:00') ]
]

games_bl18 = [
  [ 1, rapid,       [], ried,     Time.cet('2012-12-01 00:00') ],
  [ 2, sturm,       [], neustadt, Time.cet('2012-12-01 00:00') ],
  [ 3, salzburg,    [], austria,  Time.cet('2012-12-01 00:00') ],
  [ 4, wac,         [], wacker,   Time.cet('2012-12-01 00:00') ],
  [ 5, mattersburg, [], admira,   Time.cet('2012-12-01 00:00') ]
]

games_bl19 = [
  [ 1, sturm,       [], salzburg,    Time.cet('2012-12-08 00:00') ],
  [ 2, rapid,       [], wacker,      Time.cet('2012-12-08 00:00') ],
  [ 3, mattersburg, [], neustadt,    Time.cet('2012-12-08 00:00') ],
  [ 4, wac,         [], austria,     Time.cet('2012-12-08 00:00') ],
  [ 5, admira,      [], ried,        Time.cet('2012-12-08 00:00') ]
]

games_bl20 = [
  [ 1, ried,      [], wac,         Time.cet('2012-12-15 00:00') ],
  [ 2, neustadt,  [], rapid,       Time.cet('2012-12-15 00:00') ],
  [ 3, salzburg,  [], mattersburg, Time.cet('2012-12-15 00:00') ],
  [ 4, austria,   [], sturm,       Time.cet('2012-12-15 00:00') ],
  [ 5, wacker,    [], admira,      Time.cet('2012-12-15 00:00') ]
]



Game.create_from_ary!( games_bl01, bl01 )
Game.create_from_ary!( games_bl02, bl02 )
Game.create_from_ary!( games_bl03, bl03 )
Game.create_from_ary!( games_bl04, bl04 )
Game.create_from_ary!( games_bl05, bl05 )
Game.create_from_ary!( games_bl06, bl06 )
Game.create_from_ary!( games_bl07, bl07 )
Game.create_from_ary!( games_bl08, bl08 )
Game.create_from_ary!( games_bl09, bl09 )
Game.create_from_ary!( games_bl10, bl10 )
Game.create_from_ary!( games_bl11, bl11 )
Game.create_from_ary!( games_bl12, bl12 )
Game.create_from_ary!( games_bl13, bl13 )
Game.create_from_ary!( games_bl14, bl14 )
Game.create_from_ary!( games_bl15, bl15 )
Game.create_from_ary!( games_bl16, bl16 )
Game.create_from_ary!( games_bl17, bl17 )
Game.create_from_ary!( games_bl18, bl18 )
Game.create_from_ary!( games_bl19, bl19 )
Game.create_from_ary!( games_bl20, bl20 )



##################################
### ÖFB Cup 2012/13

cup = Event.create!( :title => 'ÖFB Cup 2012/13', :key => 'cup', :team3 => false, :start_at => Time.cet( '2012-07-13 00:00' ) )

cuprunde1  = Round.create!( :event => cup, :pos => 1, :title => '1. Runde', :title2 => '13.-15. Juli 2012' )
cuprunde2  = Round.create!( :event => cup, :pos => 2, :title => '2. Runde', :title2 => '25.+26. Sep 2012' )
cup16      = Round.create!( :event => cup, :pos => 3, :title => 'Achtelfinale', :title2 => '30.+31. Okt 2012' )
cup8       = Round.create!( :event => cup, :pos => 4, :title => 'Viertelfinale', :title2 => '16.+17. April 2013' )
cup4       = Round.create!( :event => cup, :pos => 5, :title => 'Halbfinale',    :title2 => '7.+8. Mai 2013' )
cup1       = Round.create!( :event => cup, :pos => 6, :title => 'Finale',        :title2 => '30. Mai 2013' )


ksv           = Team.create!( :title => 'KSV 1919 (Erste Liga/Steiermark)',              :tag => 'KSV', :key => 'ksv' )
altach        = Team.create!( :title => 'SCR Altach (Erste Liga/Vorarlberg)',            :tag => 'ALT', :key => 'altach' )
austrial      = Team.create!( :title => 'SC Austria Lustenau (Erste Liga/Vorarlberg)',   :tag => 'LUS', :key => 'austrial' )
stpoelten     = Team.create!( :title => 'SKN St. Pölten (Erste Liga/Niederösterreich)',  :tag => 'POE', :key => 'stpoelten' )
linz          = Team.create!( :title => 'FC Blau-Weiß Linz (Erste Liga/Oberösterreich)', :tag => 'BWL', :key => 'linz' )
groedig       = Team.create!( :title => 'SV Grödig (Erste Liga/Salzburg)',               :tag => 'GRO', :key => 'groedig' )
lustenau      = Team.create!( :title => 'FC Lustenau 1907 (Erste Liga/Vorarlberg)',      :tag => 'LUS', :key => 'lustenau' )
vienna        = Team.create!( :title => 'Vienna FC 1894 (Erste Liga/Wien)',              :tag => 'VIE', :key => 'vienna' )
hartberg      = Team.create!( :title => 'TSV Hartberg (Erste Liga/Steiermark)',          :tag => 'HAR', :key => 'hartberg' )
horn          = Team.create!( :title => 'SV Horn (Erste Liga/Niederösterreich)',         :tag => 'HOR', :key => 'horn' )



hard          = Team.create!( :title => 'FC Hard (West/Vorarlberg)', :tag => 'HAR',  :key => 'hard' )
bregenz       = Team.create!( :title => 'SC Bregenz (West/Vorarlberg)',  :tag => 'BRE', :key => 'bregenz' )
dornbirn      = Team.create!( :title => 'FC Dornbirn 1913 (West/Vorarlberg)',  :tag => 'DOR', :key => 'dornbirn' )
kufstein      = Team.create!( :title => 'FC Kufstein (West/Tirol)',  :tag => 'KUF', :key => 'kufstein' )
wattens       = Team.create!( :title => 'Wattens (West/Tirol)', :tag => 'WAT', :key => 'wattens' )
austrias      = Team.create!( :title => 'SV Austria Salzburg (West/Salzburg)', :tag => 'AUS', :key => 'austrias')
pinzgau       = Team.create!( :title => 'FC Pinzgau Saalfelden (West/Salzburg)', :tag => 'PIN', :key => 'pinzgau' )
stjohann      = Team.create!( :title => 'TSV St. Johann (West/Salzburg)',         :tag => 'STJ', :key => 'stjohann' )

vsv           = Team.create!( :title => 'Villacher SV (Mitte/Kärnten)', :tag => 'VSV', :key => 'vsv' )
celovec       = Team.create!( :title => 'SAK Celovec/Klagenfurt (Mitte/Kärnten)', :tag => 'CEL', :key => 'celovec' )
klagenfurt    = Team.create!( :title => 'SK Austria Klagenfurt (Mitte/Kärnten)',  :tag => 'KLA', :key => 'klagenfurt' )
kalsdorf      = Team.create!( :title => 'SC Kalsdorf (Mitte/Steiermark)', :tag => 'KAL', :key => 'kalsdorf' )
gratkorn      = Team.create!( :title => 'FC Gratkorn (Mitte/Steiermark)', :tag => 'GRA',  :key => 'gratkorn' )
allerheiligen = Team.create!( :title => 'SV Allerheiligen (Mitte/Steiermark)',    :tag => 'ALL', :key => 'allerheiligen' )
leoben        = Team.create!( :title => 'DSV Leoben (Mitte/Steiermark)',  :tag => 'LEO', :key => 'leoben' )
gak           = Team.create!( :title => 'GAK (Mitte/Steiermark)',                 :tag => 'GAK', :key => 'gak' )
pasching      = Team.create!( :title => 'FC Pasching (Mitte/Oberösterreich)', :tag => 'PAS',  :key => 'pasching' )
voecklamarkt  = Team.create!( :title => 'Vöcklamarkt (Mitte/Oberösterreich)', :tag => 'VOE', :key => 'voecklamarkt' )
stflorian     = Team.create!( :title => 'St. Florian (Mitte/Oberösterreich)', :tag => 'STF', :key => 'stflorian' )
wallern       = Team.create!( :title => 'Wallern (Mitte/Oberösterreich)', :tag => 'WAL', :key => 'wallern' )
lask          = Team.create!( :title => 'LASK Linz (Mitte/Oberösterreich)',       :tag => 'LAS', :key => 'lask' )

sollenau      = Team.create!( :title => '1. SC Sollenau (Ost/Oberösterreich)',  :tag => 'SOL', :key => 'sollenau' )
amstetten     = Team.create!( :title => 'SKU Amstetten (Ost/Niederösterreich)', :tag => 'AMS', :key => 'amstetten' )
retz          = Team.create!( :title => 'SV Retz (Ost/Niederösterreich)',  :tag => 'RET', :key => 'retz' )
fac           = Team.create!( :title => 'FAC Team für Wien (Ost/Wien)',   :tag => 'FAC',  :key => 'fac' )
schwechat     = Team.create!( :title => 'SV Schwechat (Ost/Wien)', :tag => 'SCH', :key => 'schwechat' )
wienersk      = Team.create!( :title => 'Wiener SK (Ost/Wien)',                   :tag => 'WIE', :key => 'wienersk' )
oberwart      = Team.create!( :title => 'SV Oberwart (Ost/Burgenland)',  :tag => 'OBE', :key => 'oberwart' )
parndorf      = Team.create!( :title => 'SC/ESV Parndorf 1919 (Ost/Burgenland)', :tag => 'PAR', :key => 'parndorf' )
stegersbach   = Team.create!( :title => 'SV Stegersbach (Ost/Burgenland)',        :tag => 'STE', :key => 'stegersbach' )


wolfurt       = Team.create!( :title => 'FC Wolfurt (Vorarlberg Liga)',  :tag => 'WOL', :key => 'wolfurt' )
schwaz        = Team.create!( :title => 'SC Schwaz (Tirol Liga)',                 :tag => 'SCH',  :key => 'schwaz' )
reutte        = Team.create!( :title => 'SV Reutte (Tirol Liga)',                 :tag => 'REU', :key => 'reutte' )
spittal       = Team.create!( :title => 'SV Spittal/Drau (Kärntner Liga)',        :tag => 'SPI', :key => 'spittal' )
sak           = Team.create!( :title => 'SAK 1914 (Salzburger Liga)',             :tag => 'SAK', :key => 'sak' )
dsc           = Team.create!( :title => 'Deutschlandsberger SC (Landesliga/Steiermark)', :tag => 'DSC',  :key => 'dsc' )
micheldorf    = Team.create!( :title => 'SV Micheldorf (OÖ Liga)',                :tag => 'MIC', :key => 'micheldorf' )
badvoeslau    = Team.create!( :title => 'ASK Bad Vöslau (Landesliga/Niederösterreich)', :tag => 'VOE', :key => 'badvoeslau' )
gaflenz       = Team.create!( :title => 'SV Gaflenz (Landesliga/Niederösterreich)',  :tag => 'GAF', :key => 'gaflenz' )
ardagger      = Team.create!( :title => 'Ardagger SCU (Landesliga/Niederösterreich)',  :tag => 'ARD', :key => 'ardagger' )
rohrendorf    = Team.create!( :title => 'SC Rohrendorf (2. Landesliga West/Niederösterreich)', :tag => 'ROH', :key => 'rohrendorf' )
heiligenkreuz = Team.create!( :title => 'SV Heiligenkreuz (2. Liga Süd/Niederösttereich)',  :tag => 'HEI', :key => 'heiligenkreuz' )
ostbahn       = Team.create!( :title => 'SC Ostbahn XI (Wien)',                   :tag => 'OST', :key => 'ostbahn' )
viktoria      = Team.create!( :title => 'Wiener Viktoria (Wiener Stadtliga)',     :tag => 'VIK', :key => 'viktoria' )


## 10 Bundeliga Teams

cup.teams << salzburg
cup.teams << rapid
cup.teams << admira
cup.teams << austria
cup.teams << sturm
cup.teams << ried
cup.teams << wacker
cup.teams << mattersburg
cup.teams << neustadt
cup.teams << wac

## 10 Erste Liga Teams

cup.teams << ksv
cup.teams << altach
cup.teams << austrial
cup.teams << stpoelten
cup.teams << linz
cup.teams << groedig
cup.teams << lustenau
cup.teams << vienna
cup.teams << hartberg
cup.teams << horn



games_cuprunde1 = [
  [  1, fac,          [], altach,        Time.cet('2012-07-12 19:00') ],
  [  2, hard,         [], schwaz,        Time.cet('2012-07-13 18:30') ],
  [  3, dsc,          [], hartberg,      Time.cet('2012-07-13 19:00') ], 
  [  4, gratkorn,     [], wacker,        Time.cet('2012-07-13 19:00') ],
  [  5, pasching,     [], austrias,      Time.cet('2012-07-13 19:00') ],
  [  6, parndorf,     [], admira,        Time.cet('2012-07-13 19:00') ],
  [  7, voecklamarkt, [], lustenau,      Time.cet('2012-07-13 19:00') ],
  [  8, kalsdorf,     [], wallern,       Time.cet('2012-07-13 19:00') ],
  [  9, wattens,      [], sturm,         Time.cet('2012-07-13 19:00') ],
  [ 10, vsv,          [], rohrendorf,    Time.cet('2012-07-13 19:00') ],
  [ 11, pinzgau,      [], groedig,       Time.cet('2012-07-13 19:15') ],
  [ 12, amstetten,    [], schwechat,     Time.cet('2012-07-13 19:30') ],
  [ 13, stflorian,    [], linz,          Time.cet('2012-07-13 19:30') ],
  [ 14, klagenfurt,   [], horn,          Time.cet('2012-07-13 19:30') ],
  [ 15, sak,          [], allerheiligen, Time.cet('2012-07-13 19:30') ],
  [ 16, gak,          [], vienna,        Time.cet('2012-07-13 20:00') ],
  [ 17, wienersk,     [], salzburg,      Time.cet('2012-07-13 20:30') ],
  [ 18, stegersbach,  [], reutte,        Time.cet('2012-07-14 17:00') ],
  [ 19, badvoeslau,   [], stpoelten,     Time.cet('2012-07-14 17:00') ],
  [ 20, micheldorf,   [], viktoria,      Time.cet('2012-07-14 17:00') ],
  [ 21, celovec,      [], stjohann,      Time.cet('2012-07-14 18:00') ],
  [ 22, lask,         [], spittal,       Time.cet('2012-07-14 18:00') ],
  [ 23, ostbahn,      [], wac,           Time.cet('2012-07-14 18:00') ],
  [ 24, gaflenz,      [], sollenau,      Time.cet('2012-07-14 18:00') ],
  [ 25, oberwart,     [], austria,       Time.cet('2012-07-14 18:00') ],
  [ 26, leoben,       [], mattersburg,   Time.cet('2012-07-14 18:00') ],
  [ 27, retz,         [], austrial,      Time.cet('2012-07-14 18:00') ],
  [ 28, bregenz,      [], ksv,           Time.cet('2012-07-14 18:30') ],
  [ 29, ardagger,     [], dornbirn,      Time.cet('2012-07-14 19:00') ],
  [ 30, kufstein,     [], ried,          Time.cet('2012-07-14 19:00') ],
  [ 31, wolfurt,      [], neustadt,      Time.cet('2012-07-15 10:30') ],
  [ 32, heiligenkreuz,[], rapid,         Time.cet('2012-07-15 18:00') ]
]


Game.create_knockouts_from_ary!( games_cuprunde1, cuprunde1 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.austria.2013.version', :value => '1' )
