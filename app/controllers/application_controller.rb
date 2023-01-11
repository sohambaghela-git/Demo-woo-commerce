# Main Controller
class ApplicationController < ActionController::Base
	# before_action :check_user_authentication
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
	# private
	# def check_user_authentication
	# 	if current_user.empty? 
	# 		redirect_to root_path
	# 	end
	# end
end
