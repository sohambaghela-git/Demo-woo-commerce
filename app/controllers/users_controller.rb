class UsersController < ApplicationController
  # before_action :check_user_authentication
  # before_action :getting_id, only: :show
  def index 
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Signup successful"
    else
      flash[:notice] = "Please try again"
      redirect_to '/signup'
    end
  end

	private 
  
	def user_params
		params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
	end
  def getting_id
    @user = User.find(params[:id])
  end
end