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

newspapers = Newspaper.create([{id: '1', title: "Le RCGennevilliers répond", description: "Après les succès du Real Cergy et du FC Paris samedi, le RCGennevilliers a lui aussi empoché trois points ce dimanche, lors de la 8e journée de Liga. Les Matelassiers l'ont emporté à domicile face au RC de Gennevilliers (2-0).", author: 'Michou', id_categories: '1'}])

['association', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

newuser = User.create!({
      email: 'equipe-kwak@gmail.com',
      password: 'admin123',
      password_confirmation: 'admin123'
   })

newuser.add_role :admin