class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password]) && user.verified == true
  		session[:user_id] = user.id
  		redirect_to home_path, notice: "Logged in!"
		else
			render "new"
			flash.alert = "Please wait to be verified by an admin, or your email/password is invalid"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to home_path, notice: 'Logged out.'
	end

end
