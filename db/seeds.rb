# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{ id: '1', name: 'Sport' }, { id: '2', name: 'Vie politique/sociale' }, 
	{ id: '3', name: 'Culture' }, { id: '4', name: 'Vie pratique' }, { id: '5', name: 'Sorties' },
	{ id: '6', name: 'Recherche' }, { id: '7', name: 'Formations' },
	{ id: '8', name: 'A la une' }])
