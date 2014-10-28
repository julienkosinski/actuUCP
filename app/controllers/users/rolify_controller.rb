class Users::RolifyController < ActionController::Base
	def index
	end

	def role_to_user
		# Define default role_id to the id of Association to allow call back after validation of a new user by admin. By default a new use will be an association.
		defaults = {:role_id=>"1"}
		params.replace(defaults.merge(params))
		
		# Define default to add because this method will be called back after validation of a new user by admin
  		if params[:remove_button].present?
  			remove_role_to_user
  		else
  			add_role_to_user
  		end
  		redirect_to action: 'index'
	end

  	def add_role_to_user
  		# Right now test to see if a user have already a role does not work
  		#if User::HABTM_Roles.select(:user_id).include? params[:user_id]
  			User::HABTM_Roles.create :user_id => params[:user_id], :role_id => params[:role_id]
  		#end
	end

	def remove_role_to_user
		# TOFIX
		# User::HABTM_Roles.destroy params[:user_id]
	end
end