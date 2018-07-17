class ApplicationController < ActionController::Base
	protect_from_forgery

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]

	end

	helper_method :current_user

	def authorise
		redirect_to new_session_path, alert: 'Not authorised' if current_user.nil? 
	end

	def superadmin
		redirect_to home_path, alert: 'You\'re not the superadmin. What are you trying to do.' if User.find(session[:user_id]).role != 'superadmin'
	end

end
