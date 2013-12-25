# encoding: utf-8

##############
#  Users

users = [
  [ 'Gerald',    'gerald',      { :admin => true } ],
  [ 'Franz',     'franz',       { :admin => true } ],
  [ 'Franz Sr.', 'franz.sr',    { :admin => true } ]
]

User.create_from_ary!( users )
