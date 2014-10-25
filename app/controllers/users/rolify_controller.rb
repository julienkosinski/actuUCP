class Users::RolifyController < ActionController::Base
	# Lister tous les utilisateurs et lister tous les roles dans deux menus déroulants. Une fois les deux menus déroulants sélectionnés l'utilisateur est associé à un role. Encart pour ajouter des rôles et un autre encart pour supprimer des rôles. 
	before_action :add_or_remove_common
	def index

	end

	def add_role_to_user_button #Called by button
		defaults = {:role_name=>"Association", :add_or_remove=>"add"}
		params = defaults.merge(params)
		@n.select_from_ids
	end

	def remove_role_to_user_button #Called by button
		defaults = {:role_name=>"Association", :add_or_remove=>"remove"}
		params = defaults.merge(params)
		@n.select_from_ids
	end

	def add_or_remove_common
		@n = User.new
	end
end