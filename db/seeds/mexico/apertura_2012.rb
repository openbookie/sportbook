# encoding: utf-8

# note: timezone for games (play_at) is *always* CST (central standard time / -6 hours ??)


puts "*** loading seed data in seeds/mexico/apertura_2012.rb"


mx = Event.create!( :key => 'mx_ap_2012',
                    :title => 'México Primera División Apertura 2012',
                    :start_at => Time.cst('2012-07-20 00:00')  )


america   = Team.find_by_key!( 'america' )
atlante   = Team.find_by_key!( 'atlante' )
atlas     = Team.find_by_key!( 'atlas'   )
chivas    = Team.find_by_key!( 'chivas'  )
cruzazul  = Team.find_by_key!( 'cruzazul' )
jaguares  = Team.find_by_key!( 'jaguares' )
leon      = Team.find_by_key!( 'leon'  )
monarcas  = Team.find_by_key!( 'monarcas' )
monterrey = Team.find_by_key!( 'monterrey' )
pachuca   = Team.find_by_key!( 'pachuca'  )
puebla    = Team.find_by_key!( 'puebla'  )
queretaro = Team.find_by_key!( 'queretaro' )
sanluis   = Team.find_by_key!( 'sanluis' )
slaguna   = Team.find_by_key!( 'slaguna'  )
tijuana   = Team.find_by_key!( 'tijuana'  )
toluca    = Team.find_by_key!( 'toluca' )
tigres    = Team.find_by_key!( 'tigres' )
pumas     = Team.find_by_key!( 'pumas' )


mx.teams << america
mx.teams << atlante
mx.teams << atlas
mx.teams << chivas
mx.teams << cruzazul
mx.teams << jaguares
mx.teams << leon
mx.teams << monarcas
mx.teams << monterrey
mx.teams << pachuca
mx.teams << puebla
mx.teams << queretaro
mx.teams << sanluis
mx.teams << slaguna
mx.teams << tijuana
mx.teams << toluca
mx.teams << tigres
mx.teams << pumas

j1 = Round.create!( :event => mx, :pos => 1, :title => 'Jornada 1', :title2 => '20, 21 y 22 de julio' )
j2 = Round.create!( :event => mx, :pos => 2, :title => 'Jornada 2', :title2 => '27, 28 y 29 de julio' )
j3 = Round.create!( :event => mx, :pos => 3, :title => 'Jornada 3', :title2 => '3, 4, y 5 de agosto' )
j4 = Round.create!( :event => mx, :pos => 4, :title => 'Jornada 4', :title2 => '10, 11 y 12 de agosto' )
j5 = Round.create!( :event => mx, :pos => 5, :title => 'Jornada 5', :title2 => '17, 18 y 19 de agosto' )
j6 = Round.create!( :event => mx, :pos => 6, :title => 'Jornada 6', :title2 => '24, 25 y 26 de agosto' )
j7 = Round.create!( :event => mx, :pos => 7, :title => 'Jornada 7', :title2 => '31 de agosto, 1 y 2 de septiembre' )
j8 = Round.create!( :event => mx, :pos => 8, :title => 'Jornada 8', :title2 => '14, 15 y 16 de septiembre' )


games_j1 = [
  [1, jaguares,  [], tigres,   Time.cst('2012-07-20 19:30') ],
  [2, tijuana,   [], puebla,   Time.cst('2012-07-20 21:30') ],
  [3, cruzazul,  [], monarcas, Time.cst('2012-07-21 17:00') ],
  [4, queretaro, [], leon,     Time.cst('2012-07-21 17:00') ],
  [5, slaguna,   [], sanluis,  Time.cst('2012-07-21 19:00') ],
  [6, monterrey, [], america,  Time.cst('2012-07-21 19:00') ],
  [7, atlas,     [], pumas,    Time.cst('2012-07-21 21:00') ],
  [8, toluca,    [], chivas,   Time.cst('2012-07-22 12:00') ],
  [9, atlante,   [], pachuca,  Time.cst('2012-07-22 18:00') ]]


games_j2 = [
  [1, monarcas,   [], monterrey,   Time.cst('2012-07-27 19:30') ],
  [2, leon,       [], tijuana,     Time.cst('2012-07-27 21:30') ],
  [3, america,    [], jaguares,    Time.cst('2012-07-28 17:00') ],
  [4, pachuca,    [], atlas,       Time.cst('2012-07-28 19:00') ],
  [5, tigres,     [], atlante,     Time.cst('2012-07-28 19:00') ],
  [6, sanluis,    [], cruzazul,    Time.cst('2012-07-28 21:00') ],
  [7, puebla,     [], toluca,      Time.cst('2012-07-29 12:00') ],
  [8, pumas,      [], queretaro,   Time.cst('2012-07-29 12:00') ],
  [9, chivas,     [], slaguna,     Time.cst('2012-07-29 17:00')]]

games_j3 = [
  [1, slaguna,     [], puebla,    Time.cst('2012-08-03 19:00') ],
  [2, tijuana,     [], pumas,     Time.cst('2012-08-03 19:30') ],
  [3, monarcas,    [], sanluis,   Time.cst('2012-08-03 21:30') ],
  [4, cruzazul,    [], chivas,    Time.cst('2012-08-04 17:00') ],
  [5, queretaro,   [], pachuca,   Time.cst('2012-08-04 17:00') ],
  [6, monterrey,   [], jaguares,  Time.cst('2012-08-04 19:00') ],
  [7, atlas,       [], tigres,    Time.cst('2012-08-04 21:00') ],
  [8, toluca,      [], leon,      Time.cst('2012-08-05 12:00') ],
  [9, atlante,     [], america,   Time.cst('2012-08-05 18:00') ]]





Game.create_from_ary!( games_j1, j1 )
Game.create_from_ary!( games_j2, j2 )
Game.create_from_ary!( games_j3, j3 )

## todo: use new version constant for app module e.g. Wettpool::VERSION ??
Prop.create!( :key => 'db.seeds.mexico.apertura.2012.version', :value => '1' )
