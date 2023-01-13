class SessionsController < ApplicationController
  before_action :user_already_exist, only: [:new]
  def new
  end
  def create
    user = User.find_by(email: params[:email])
    # byebug
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successful"
      redirect_to '/'
    else
      flash[:notice] = "Invalid Email or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to '/login'
  end
  private 
  def user_already_exist
    if current_user.present?
      flash[:notice] = " Oops You Are already, Please logout first  " 
      redirect_to root_path
    else

    end
  end
end
