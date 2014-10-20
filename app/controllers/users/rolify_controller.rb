class Users::RolifyController < ActionController::Base
	# Lister tous les utilisateurs et lister tous les roles dans deux menus déroulants. Une fois les deux menus déroulants sélectionnés l'utilisateur est associé à un role.
	def add_role_to_user
		@users = User.all
		@roles = Role.all
	end

	def remove_role_to_user
		@users = User.all
		@roles = Role.all
	end
	
	def update_role_to_user

	end
end