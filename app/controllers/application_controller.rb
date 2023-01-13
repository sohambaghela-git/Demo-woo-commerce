# Main Controller
class ApplicationController < ActionController::Base
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	private
	def check_user_authentication
		if current_user.present?
 			flash[:notice] = "you can "
		else
			flash[:notice] = "Please Login First"
			redirect_to login_path
		end
	end
end
