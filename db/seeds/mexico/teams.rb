# encoding: utf-8


## todo: add image for Club León

teams = [
 [ 'america',   'mx/america.png' ],
 [ 'atlante',   'mx/atlante.png' ],
 [ 'atlas',     'mx/atlas.png' ],
 [ 'chivas',    'mx/chivas.png' ],
 [ 'cruzazul',  'mx/cruzazul.png' ],
 [ 'jaguares',  'mx/jaguares.png' ],
# [ 'leon',     'xxx' ],
 [ 'monarcas',  'mx/monarcas.png' ],
 [ 'monterrey', 'mx/monterrey.png' ],
 [ 'pachuca',   'mx/pachuca.png' ],
 [ 'puebla',    'mx/puebla.png' ],
 [ 'queretaro', 'mx/queretaro.png' ],
 [ 'sanluis',   'mx/sanluis.png' ],
 [ 'slaguna',   'mx/slaguna.png' ],
 [ 'tijuana',   'mx/tijuana.png' ],
 [ 'toluca',    'mx/toluca.png' ],
 [ 'tigres',    'mx/tigres.jpg' ],
 [ 'pumas',     'mx/pumas.png' ]
]

Team.update_image_from_ary!( teams )


Prop.create!( :key => 'db.mx.teams.2.version', :value => '1' )