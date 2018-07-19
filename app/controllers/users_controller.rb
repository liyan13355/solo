class UsersController < ApplicationController
	before_action :authorise, :only => [:index]
	before_action :superadmin, :only => [:index]


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

	def index

		@users = User.where(verified: false).order(:last_name)
	end

	def update
		@user = User.find(params[:id]).update(verified: true)

		redirect_back fallback_location: users_path
	end

	private

	def allowed_params
		params.require(:user).permit(:first_name, :last_name, :title, :email, :password, :password_confirmation)
	end

end
