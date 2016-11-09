class UsersController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource
  before_action :set_user, except: [:index]

	def index
		if current_user.admin?
			@users = User.all.order("created_at DESC")
		else
			redirect_to root_path
			flash[:danger] = "You are not authorized to access this page"
		end
	end

	def show
	end

	def edit
	end

	def update
			
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		@user.update(user_params)
		redirect_to users_url
	end

	def destroy
		
		@user.destroy!
		redirect_to users_url
	end

	private 

		def user_params
			params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :current_password)
		end

    def set_user
      @user = User.find(params[:id])
    end
end
