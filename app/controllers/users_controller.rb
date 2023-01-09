class UsersController < ApplicationController
  # before_action :login_condition, only: :login
  # before_action :getting_id, only: :show

  def show
  end

  def new 
    @user=User.new
  end

  
  def create 
    @user=User.new(user_param)
    if @user.save
      redirect_to "/users/login"
    else
      render :new, status: :unprocessable_entity
    end
  end
	def login
    @user = User.find_by(email: params[:email])
    if @user.password == (params[:password])
      if @user.status == "admin"
        redirect_to  new_user_post_path(:user_id), allow_other_host: true
      elsif @user.status == "customer"
        redirect_to "/users/posts/"
      end
    else
      render :login, status: :unprocessable_entity
    end 
	end

	private 
	def user_param
		params.require(:user).permit(:name, :email, :role, :password)
	end

  def getting_id
    @user=User.find(params[:id])
  end

end