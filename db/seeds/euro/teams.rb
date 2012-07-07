# encoding: utf-8

puts "*** loading seed data in seeds/euro/teams.rb"


Team.create!( :key => 'pol', :title => 'Polen',      :tag => 'POL',  :img => 'euro/poland2.png' )
Team.create!( :key => 'gre', :title => 'Griechenland', :tag => 'GRE',  :img => 'euro/greece2.png' )
Team.create!( :key => 'rus', :title => 'Russland',     :tag => 'RUS',  :img => 'euro/russia2.png' )
Team.create!( :key => 'cze', :title => 'Tschechien',   :tag => 'CZE',   :img => 'euro/czech_republic2.png' )

Team.create!( :key => 'ned', :title => 'Niederlande', :tag => 'NED',  :img => 'euro/netherlands2.png' )
Team.create!( :key => 'den', :title => 'Dänemark',    :tag => 'DEN',  :img => 'euro/denmark2.png' )
Team.create!( :key => 'ger', :title => 'Deutschland', :tag => 'GER',  :img => 'euro/germany2.png' )
Team.create!( :key => 'por', :title => 'Portugal',    :tag => 'POR',  :img => 'euro/portugal2.png' )

Team.create!( :key => 'esp', :title => 'Spanien',  :tag => 'ESP',   :img => 'euro/spain2.png' )
Team.create!( :key => 'ita', :title => 'Italien',  :tag => 'ITA',    :img => 'euro/italy2.png' )
Team.create!( :key => 'irl', :title => 'Irland',   :tag => 'IRL',  :img => 'euro/ireland2.png' )
Team.create!( :key => 'cro', :title => 'Kroatien', :tag => 'CRO',  :img => 'euro/croatia2.png' )

Team.create!( :key => 'ukr', :title => 'Ukraine',    :tag => 'UKR',  :img => 'euro/ukraine2.png' )
Team.create!( :key => 'swe', :title => 'Schweden',   :tag => 'SWE',  :img => 'euro/sweden2.png' )
Team.create!( :key => 'fra', :title => 'Frankreich', :tag => 'FRA',   :img => 'euro/france2.png' )
Team.create!( :key => 'eng', :title => 'England',    :tag => 'ENG',  :img => 'euroa/england2.png' )



## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.euro.teams.version', :value => '1' )
