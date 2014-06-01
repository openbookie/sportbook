# encoding: utf-8

##############
#  Users

users = [
  [ 'N.N.',        'nn' ],   # standard no name pool manager placeholder
  [ 'Dietmar B',   'dietmar', { :admin => true } ]
]


User.create_from_ary!( users )

