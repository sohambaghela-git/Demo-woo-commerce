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
	def match_url_and_session_ids
		if (current_user.id).eql?(params[:user_id])
			flash[:notice] = " yeah you can "
		else
			flash[:notice] = " Sorry you can not access "
			redirect_to root_path
		end
	end
end
