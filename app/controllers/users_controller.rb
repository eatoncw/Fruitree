class UsersController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		if current_user.admin?
			@users = User.all.order("created_at DESC")
		else
			redirect_to root_path
			flash[:danger] = "You are not authorized to access this page"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
			
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		@user.update(user_params)
		redirect_to users_url
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy!
		redirect_to users_url
	end

	private 

		def user_params
			params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :current_password)
		end
end
