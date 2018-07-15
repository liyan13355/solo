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

end
