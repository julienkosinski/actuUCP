class Users::RolifyController < ActionController::Base
	layout "newspapers"
	def index
	end

	def role_to_user
		if params[:remove_button].present?
  			remove_role_to_user
  		else
  			add_role_to_user
  		end
  		redirect_to request.referer
	end

  	def add_role_to_user
		user = User.find(params[:user_id])
		user.add_role params[:role_name]
	end

	def remove_role_to_user
		user = User.find(params[:user_id])
		user.delete_role params[:role_name]
	end
end