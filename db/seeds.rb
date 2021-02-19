# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Employee.create(last_name: 'Genest', first_name: 'Nicolas', title: 'CEO', 'email' => 'nicolas.genest@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Fortier', first_name: 'Nadya', title: 'Director', 'email' => 'nadya.fortier@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Chantal', first_name: 'Martin', title: 'Director Assistant', 'email' => 'martin.chantal@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Houde', first_name: 'Mathieu', title: 'Captain', 'email' => 'mathieu.houde@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Boutin', first_name: 'David', title: 'Engineer', 'email' => 'david.boutin@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Lortie', first_name: 'Mathieu', title: 'Engineer', 'email' => 'mathieu.lortie@codeboxx.biz', 'active' => 1)
Employee.create(last_name: 'Carrier', first_name: 'Thomas ', title: 'Engineer', 'email' => 'thomas.carrier@codeboxx.biz', 'active' => 1)