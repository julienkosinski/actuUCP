class User < ActiveRecord::Base
  belongs_to :role
  before_create :set_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def delete_role(role_symbol,target=nil)
	    UsersRoles.delete_role self,role_symbol,target
	end

	private
	def set_default_role
		self.add_role('association')
	end
end