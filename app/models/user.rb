class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	attr_accessor :user_name, :role_name, :add_or_remove
  	
  	def select_from_ids
  		#params.require(:user_name, :role_name = "Association", :add_or_remove)
  		@user_id = User.pluck(:id).where(email: params[:user_name])
  		@role_id = Role.pluck(:id).where(name: params[:role_name])
  		if params[:add_or_remove] == "add"
  			add_role_to_user
  		end
  		if params[:add_or_remove] == "remove"
  			remove_role_to_user
  		end
  	end

  	def add_role_to_user
  		#user_id, user_role et role_name seront placés via le controlleur. On insère role_id et user_id correct dans la table de jointure users_roles

  		User::HABTM_Roles.create :user_id => @user_id, :role_id => @role_id
	end

	def remove_role_to_user
		User::HABTM_Roles.delete :user_id => @user_id, :role_id => @role_id
	end

end
