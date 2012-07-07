# encoding: utf-8

puts "*** loading seed data in seeds/austria/teams.rb"


Team.create!( :key => 'salzburg',    :title => 'FC RB Salzburg',      :tag => 'RBS',  :img => 'at/salzburg.png' )
Team.create!( :key => 'rapid',       :title => 'SK Rapid Wien',       :tag => 'RAP',  :img => 'at/rapid.png' )
Team.create!( :key => 'admira',      :title => 'FC Admira Wacker',    :tag => 'ADM',  :img => 'at/admira.png' )
Team.create!( :key => 'austria',     :title => 'FK Austria Wien',     :tag => 'FAK',  :img => 'at/austria.png' )
Team.create!( :key => 'sturm',       :title => 'SK Sturm Graz',       :tag => 'STU',  :img => 'at/sturm.png' )
Team.create!( :key => 'ried',        :title => 'SV Ried',             :tag => 'RIED', :img => 'at/ried.png' )
Team.create!( :key => 'wacker',      :title => 'FC Wacker Innsbruck', :tag => 'IBK',  :img => 'at/wacker.png' )
Team.create!( :key => 'mattersburg', :title => 'SV Mattersburg',      :tag => 'SVM',  :img => 'at/mattersburg.png' )
Team.create!( :key => 'neustadt',    :title => 'SC Wiener Neustadt',  :tag => 'WRN',  :img => 'at/neustadt.png' )
Team.create!( :key => 'wac',         :title => 'Wolfsberger AC',      :tag => 'WAC',  :img => 'at/wac.png' )


Team.create!( :key => 'juniors',    :title => 'FC RB Juniors Salzburg', :img => 'at/salzburg.png' )

Team.create!( :key => 'ksv',       :title => 'Kapfenberger SV 1919', :title2 => 'Erste Liga/Stmk.',  :tag => 'KSV',        :img => 'at/ksv.png' )
Team.create!( :key => 'altach',    :title => 'SCR Altach'          , :title2 => 'Erste Liga/Vbg.',   :tag => 'ALT',     :img => 'at/altach.png' )
Team.create!( :key => 'austrial',  :title => 'SC Austria Lustenau' , :title2 => 'Erste Liga/Vbg.',   :tag => 'LUS',  :img => 'at/austrial.png' )
Team.create!( :key => 'stpoelten', :title => 'SKN St. Pölten',       :title2 => 'Erste Liga/NÖ',     :tag => 'POE',  :img => 'at/stpoelten.png' )
Team.create!( :key => 'linz',      :title => 'FC Blau-Weiß Linz',    :title2 => 'Erste Liga/OÖ',     :tag => 'BWL',       :img => 'at/linz.png' )
Team.create!( :key => 'groedig',   :title => 'SV Grödig',            :title2 => 'Erste Liga/Sbg.',   :tag => 'GRO',   :img => 'at/groedig.png' )
Team.create!( :key => 'lustenau',  :title => 'FC Lustenau 1907',     :title2 => 'Erste Liga/Vbg.',   :tag => 'LUS',   :img => 'at/lustenau.png' )
Team.create!( :key => 'vienna',    :title => 'Vienna FC 1894',       :title2 => 'Erste Liga/Wien',   :tag => 'VIE',    :img => 'at/vienna.png' )
Team.create!( :key => 'hartberg',  :title => 'TSV Hartberg',         :title2 => 'Erste Liga/Stmk.',  :tag => 'HAR', :img => 'at/hartberg.png' )
Team.create!( :key => 'horn',      :title => 'SV Horn',              :title2 => 'Erste Liga/NÖ',     :tag => 'HOR',     :img => 'at/horn.png' )



Team.create!( :key => 'hard',     :title => 'FC Hard',               :title2 => 'Regionalliga West/Vbg.', :tag => 'HAR' )
Team.create!( :key => 'bregenz',  :title => 'SC Bregenz',            :title2 => 'Regionalliga West/Vbg.',  :tag => 'BRE' )
Team.create!( :key => 'dornbirn', :title => 'FC Dornbirn 1913',      :title2 => 'Regionalliga West/Vbg.',  :tag => 'DOR' )
Team.create!( :key => 'kufstein', :title => 'FC Kufstein',           :title2 => 'Regionalliga West/Tirol',  :tag => 'KUF' )
Team.create!( :key => 'wattens',  :title => 'WSG Wattens',           :title2 => 'Regionalliga West/Tirol', :tag => 'WAT' )
Team.create!( :key => 'austrias', :title => 'SV Austria Salzburg',   :title2 => 'Regionalliga West/Sbg.', :tag => 'AUS' )
Team.create!( :key => 'pinzgau',  :title => 'FC Pinzgau Saalfelden', :title2 => 'Regionalliga West/Sbg.', :tag => 'PIN' )
Team.create!( :key => 'stjohann', :title => 'TSV St. Johann',        :title2 => 'Regionalliga West/Sbg.', :tag => 'STJ' )

Team.create!( :title => 'Villacher SV',           :title2 => 'Regionalliga Mitte/Ktn.', :tag => 'VSV', :key => 'vsv' )
Team.create!( :title => 'SAK Celovec/Klagenfurt', :title2 => 'Regionalliga Mitte/Ktn.', :tag => 'CEL', :key => 'klagenfurt' )
Team.create!( :title => 'SK Austria Klagenfurt',  :title2 => 'Regionalliga Mitte/Ktn.',  :tag => 'KLA', :key => 'austriak' )
Team.create!( :title => 'SC Kalsdorf',            :title2 => 'Regionalliga Mitte/Stmk.', :tag => 'KAL', :key => 'kalsdorf' )
Team.create!( :title => 'FC Gratkorn',            :title2 => 'Regionalliga Mitte/Stmk.', :tag => 'GRA',  :key => 'gratkorn' )
Team.create!( :title => 'SV Allerheiligen',       :title2 => 'Regionalliga Mitte/Stmk.', :tag => 'ALL', :key => 'allerheiligen' )
Team.create!( :title => 'DSV Leoben',             :title2 => 'Regionalliga Mitte/Stmk.', :tag => 'LEO', :key => 'leoben' )
Team.create!( :title => 'Grazer AK',              :title2 => 'Regionalliga Mitte/Stmk.', :tag => 'GAK', :key => 'gak' )
Team.create!( :title => 'FC Pasching',            :title2 => 'Regionalliga Mitte/OÖ',    :tag => 'PAS',  :key => 'pasching' )
Team.create!( :title => 'Vöcklamarkt',            :title2 => 'Regionalliga Mitte/OÖ',    :tag => 'VOE', :key => 'voecklamarkt' )
Team.create!( :title => 'St. Florian',            :title2 => 'Regionalliga Mitte/OÖ',    :tag => 'STF', :key => 'stflorian' )
Team.create!( :title => 'Wallern',                :title2 => 'Regionalliga Mitte/OÖ',    :tag => 'WAL', :key => 'wallern' )
Team.create!( :title => 'LASK Linz',              :title2 => 'Regionalliga Mitte/OÖ',    :tag => 'LAS', :key => 'lask' )

Team.create!( :title => '1. SC Sollenau',         :title2 => 'Regionalliga Ost/OÖ',    :tag => 'SOL', :key => 'sollenau' )
Team.create!( :title => 'SKU Amstetten',          :title2 => 'Regionalliga Ost/NÖ',    :tag => 'AMS', :key => 'amstetten' )
Team.create!( :title => 'SV Retz',                :title2 => 'Regionalliga Ost/NÖ',    :tag => 'RET', :key => 'retz' )
Team.create!( :title => 'FAC Team für Wien',      :title2 => 'Regionalliga Ost/Wien',  :tag => 'FAC',  :key => 'fac' )
Team.create!( :title => 'SV Schwechat',           :title2 => 'Regionalliga Ost/Wien',  :tag => 'SCH', :key => 'schwechat' )
Team.create!( :title => 'Wiener SK',              :title2 => 'Regionalliga Ost/Wien',  :tag => 'WIE', :key => 'wienersk' )
Team.create!( :title => 'SC Ostbahn XI',          :title2 => 'Regionalliga Ost/Wien',  :tag => 'OST', :key => 'ostbahn' )
Team.create!( :title => 'SV Oberwart',            :title2 => 'Regionalliga Ost/Bgld.', :tag => 'OBE', :key => 'oberwart' )
Team.create!( :title => 'SC/ESV Parndorf 1919',   :title2 => 'Regionalliga Ost/Bgld.', :tag => 'PAR', :key => 'parndorf' )
Team.create!( :title => 'SV Stegersbach',         :title2 => 'Regionalliga Ost/Bgld.', :tag => 'STE', :key => 'stegersbach' )


Team.create!( :title => 'FC Wolfurt',             :title2 => 'Vorarlberg Liga',  :tag => 'WOL', :key => 'wolfurt' )
Team.create!( :title => 'SC Schwaz',              :title2 => 'Tirol Liga',       :tag => 'SCH',  :key => 'schwaz' )
Team.create!( :title => 'SV Reutte',              :title2 => 'Tirol Liga',       :tag => 'REU', :key => 'reutte' )
Team.create!( :title => 'SV Spittal/Drau',        :title2 => 'Kärntner Liga',    :tag => 'SPI', :key => 'spittal' )
Team.create!( :title => 'SAK 1914',               :title2 => 'Salzburger Liga',  :tag => 'SAK', :key => 'sak' )
Team.create!( :title => 'Deutschlandsberger SC',  :title2 => 'Landesliga/Stmk.', :tag => 'DSC',  :key => 'dsc' )
Team.create!( :title => 'SV Micheldorf',          :title2 => 'OÖ Liga',          :tag => 'MIC', :key => 'micheldorf' )
Team.create!( :title => 'ASK Bad Vöslau',         :title2 => 'Landesliga/NÖ',    :tag => 'VOE', :key => 'badvoeslau' )
Team.create!( :title => 'SV Gaflenz',             :title2 => 'Landesliga/NÖ',    :tag => 'GAF', :key => 'gaflenz' )
Team.create!( :title => 'Ardagger SCU',           :title2 => 'Landesliga/NÖ',    :tag => 'ARD', :key => 'ardagger' )
Team.create!( :title => 'SC Rohrendorf',          :title2 => '2. Landesliga West/NÖ', :tag => 'ROH', :key => 'rohrendorf' )
Team.create!( :title => 'SV Heiligenkreuz',       :title2 => '2. Liga Süd/NÖ',   :tag => 'HEI', :key => 'heiligenkreuz' )
Team.create!( :title => 'Wiener Viktoria',        :title2 => 'Wiener Stadtliga', :tag => 'VIK', :key => 'viktoria' )



