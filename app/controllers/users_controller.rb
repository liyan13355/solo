require 'byebug'
class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		
		@user = User.new(allowed_params)
		if @user.save
			redirect_to home_path, notice: 'Thanks for signing up, please wait to be verified before you can use this site'
		else
			render :new
		end
	end


	private

	def allowed_params
		params.require(:user).permit(:first_name, :last_name, :title, :email, :password, :password_confirmation)
	end

end
