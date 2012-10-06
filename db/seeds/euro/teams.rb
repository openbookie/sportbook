# encoding: utf-8

teams = [
  [ 'pol', 'euro/poland2.png' ],
  [ 'gre', 'euro/greece2.png' ],
  [ 'rus', 'euro/russia2.png' ],
  [ 'cze', 'euro/czech_republic2.png' ],
  [ 'ned', 'euro/netherlands2.png' ],
  [ 'den', 'euro/denmark2.png' ],
  [ 'ger', 'euro/germany2.png' ],
  [ 'por', 'euro/portugal2.png' ],
  [ 'esp', 'euro/spain2.png' ],
  [ 'ita', 'euro/italy2.png' ],
  [ 'irl', 'euro/ireland2.png' ],
  [ 'cro', 'euro/croatia2.png' ],
  [ 'ukr', 'euro/ukraine2.png' ],
  [ 'swe', 'euro/sweden2.png' ],
  [ 'fra', 'euro/france2.png' ],
  [ 'eng', 'euro/england2.png' ],
  [ 'fro', 'euro/faroer2.png' ],
  [ 'kaz', 'euro/kaz2.png' ],
  [ 'aut', 'euro/austria2.png' ]
]



Team.update_image_from_ary!( teams )


Prop.create!( :key => 'db.euro.teams.2.version', :value => '1' )
