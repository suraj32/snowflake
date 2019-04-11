class RolesController < ApplicationController
	def index
		@roles = Role.all
	end

	def show
	end

	def edit
		@role = Role.find(params[:id])
	end

	def update
		role = Role.find(params[:id])
 
  	if role.update(role_params)
    	redirect_to roles_path
  	else
    	render 'edit'
  	end
	end

	def destroy
		role = Role.find(params[:id])
  	role.destroy

  	redirect_to roles_path
	end

	private
		def role_params
			params.require(:role).permit(:name, can_assess: [])
		end
end
