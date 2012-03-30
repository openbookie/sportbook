# encoding: utf-8

class AddEuropaLeague < ActiveRecord::Migration
  
  def up

el = Event.create!( :title => 'Europa League 2012', :key => 'el', :team3 => false )

az       = Team.create!( :title => 'AZ Alkmaar',              :key => 'az',       :img => 'az.png' )
valencia = Team.create!( :title => 'Valencia CF',             :key => 'valencia', :img => 'valencia.png' )
schalke  = Team.create!( :title => 'FC Schalke 04',           :key => 'schalke',  :img => 'schalke.png' )
athletic = Team.create!( :title => 'Athletic Club Bilbao',    :key => 'athletic', :img => 'athletic.png' )
sporting = Team.create!( :title => 'Sporting Clube Portugal', :key => 'sporting', :img => 'sporting.png' )
metalist = Team.create!( :title => 'FC Metalist Kharkiv',     :key => 'metalist', :img => 'metalist.png' )
atletico = Team.create!( :title => 'Club Atlético Madrid',    :key => 'atletico', :img => 'atletico.png' )
hannover = Team.create!( :title => 'Hannover 96',             :key => 'hannover', :img => 'hannover.png' )

el.teams << az
el.teams << valencia
el.teams << schalke
el.teams << athletic
el.teams << sporting
el.teams << metalist
el.teams << atletico
el.teams << hannover

el8    = Round.create!( :event => el, :pos => 1, :title => 'Viertelfinale : 29. März 2012' )
el8_2  = Round.create!( :event => el, :pos => 2, :title => 'Viertelfinale Rückspiele : 5. April 2012' )
el4    = Round.create!( :event => el, :pos => 3, :title => 'Halbfinale : 19. April 2012',             :calc => true )
el4_2  = Round.create!( :event => el, :pos => 4, :title => 'Halbfinale Rückspiele : 26. April 2012',  :calc => true )
el1    = Round.create!( :event => el, :pos => 5, :title => 'Finale : 9. Mai 2012',                    :calc => true )

games_el8 = [
  [[ 1, az,          2,   1, valencia,   '2012-03-29 20:45' ],
   [ 1, valencia,  nil, nil, az,         '2012-04-05 20:45' ]],
  [[ 2, schalke,     2,   4, athletic,   '2012-03-29 20:45' ],
   [ 2, athletic,  nil, nil, schalke,    '2012-04-05 20:45' ]],
  [[ 3, sporting,    2,   1, metalist,   '2012-03-29 20:45' ],
   [ 3, metalist,  nil, nil, sporting,   '2012-04-05 20:45' ]],
  [[ 4, atletico,    2,   1, hannover,   '2012-03-29 20:45' ],
   [ 4, hannover,  nil, nil, atletico,   '2012-04-05 20:45' ]]
]

Game.create_knockout_pairs_from_ary!( games_el8, el8, el8_2 )


## setup pool

ande  =  User.find_by_email!( 'ande' )

pool = Pool.create!( :event => el, :title => 'UNIQA USS EF Test', :user => ande, :welcome => '' )
pool.players << ande  # also add amin first


  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
