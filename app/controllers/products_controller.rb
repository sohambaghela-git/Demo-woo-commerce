# Product Class for Customer and Admin
class ProductsController < ApplicationController
  # before_action :check_user_authentication
  before_action :check_admin, only: [:new, :create]
  

  def index
    @products = Product.all
    @user = params[:user_id]
    @user_detail = User.find(@user)
  end

  def show
    @product = Product.find(params[:id])
    @user = params[:user_id]
    @user_detail = User.find(@user)
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    @user_id = params[:user_id]
    @product.user_id = @user_id
    #byebug
    if @product.save
      flash[:notice] = "Your Product is Saved Successfully"
      # byebug
      redirect_to user_product_path(user_id: @user_id, id: @product.id)
    else
      flash[:notice] = "Please try again"
      redirect_to new_user_product(@user_id)
    end
  end

  def update
  end

  private 
  def product_params
    params.require(:product).permit!
  end
  def match_users
    (current_user.id).to_s.eql?(params[:user_id])

  end
  def check_admin
    # byebug
    if match_users
      if current_user.role == "admin"
      # byebug
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
  
end