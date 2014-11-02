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

newspapers = Newspaper.create([{id: '1', title: "Le RCGennevilliers répond", description: "Après les succès du Real Cergy et du FC Paris samedi, le RCGennevilliers a lui aussi empoché trois points ce dimanche, lors de la 8e journée de Liga. Les Matelassiers l'ont emporté à domicile face au RC de Gennevilliers (2-0).", author: 'Michou', id_categories: '1'}, 
	{id: '2', title: "Barrage de Gennevilliers : bientôt un référendum local ?", description: "Guillaume Peltier (UMP) et Pouria Amirshahi (PS) souhaitent interroger la population du Tarn sur la poursuite ou non du projet controversé.", author: 'Michou', id_categories: '2'},
	{id: '3', title: "La folie du fugueur sous l'oeil de Minh Tran Huy", description: "À partir du cas historique d'Albert Dadas atteint de ""dromomanie"", ou ""folie du fugueur"" Minh Tran Huy mêle l'Histoire et l'intime pour interroger sur l'exil et le déracinement.", author: 'Michou', id_categories: '3'},
	{id: '4', title: "Comment choisir le gel douche qu’il me faut ?", description: "La douche et le bain sont bien plus qu’un passage obligé. Avec un savon ou un gel lavant adapté, ils se transforment en une séance de soins pour la peau.", author: 'Michou', id_categories: '4'},
	{id: '5', title: "Canailles Connection", description: "Trois hommes vieillissants et un adolescent, Yonatan, se retrouvent coincés ensemble dans une maison de repos de Jérusalem. Yonatan est un génie, mais il bégaie et se fait malmener à l'école. Le grand-père de Yonatan, Eliahu, qu'il n'a jamais rencontré, est un ancien membre du Lehi, un groupe radical armé des années 1940. Le vieil homme est froid comme la pierre. Le meilleur ami d'Eliahu, qu'il a connu au Lehi, est plein de passion et d'ambition, mais frustré. Et le beau-frère britannique d'Eliahu, un acteur ringard de troisième zone, s'est lourdement endetté.", author: 'Michou', id_categories: '5'},
	{id: '6', title: "Comment savons-nous que nous sommes morts ?", description: "Cessons-nous de vivre quand notre cœur s’arrête ? Ou quand notre cerveau ne répond plus ? Les progrès de la réanimation et des prélèvements d’organes font évoluer la définition de la mort.", author: 'Michou', id_categories: '6'},
	{id: '7', title: "Fonction formation : faire de la réforme un levier", description: "Nombre de responsables de formation s’inquiètent de la réforme : fin du budget plan « contraint », du DIF prioritaire, accès plus difficile au refinancement sur période de professionnalisation … Autant de motifs d’inquiétude, qui se traduisent souvent par la question : «comment défendre mon budget demain » ?", author: 'Michou', id_categories: '7'},
	{id: '8', title: "A Paris et à Sivens, des hommages à Rémi Fraisse sans incidents", description: "Après les manifestations qui avaient dégénéré samedi à Nantes, Dijon et Toulouse, ce sont des rassemblements pacifiques qui se sont tenus à Paris et Sivens pour honorer la mémoire de Rémi Fraisse.", author: 'Michou', id_categories: '8'}])

['association', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

newuser = User.create!({
      email: 'equipe-kwak@gmail.com',
      password: 'admin123',
      password_confirmation: 'admin123'
   })

newuser.add_role :admin