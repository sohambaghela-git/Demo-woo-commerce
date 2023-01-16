# Product Class for Customer and Admin
class ProductsController < ApplicationController
	# To check User is Logged_in or Not
  before_action :check_user_authentication
	# before_action :match_url_and_session_ids
  # To checking condition for Admin to Create and update Products
  before_action :check_seller, only: [:new, :create]
  before_action :check_seller_for_update, only: [:edit, :update]

  def index
    @products = []
    @products << Product.where(user_id: params[:user_id])
    @products = @products.flatten
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
      redirect_to user_product_path(user_id: @user_id, id: @product.id)
    else
      flash[:notice] = "Please try again"
      redirect_to new_user_product(@user_id)
    end
  end

  def edit
    # byebug
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    # byebug
    if @product.update(product_params)
      # byebug
      flash[:notice] = "Product updated"
      redirect_to new_user_product_path 
    else
      flash[:notice] = "Product has not updated"
      redirect_to new_user_product_path 
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :price, :user_id)
  end
  def match_users
    (current_user.id).to_s.eql?(params[:user_id])
  end
  def check_seller
    if match_users
      if (current_user.role).eql?("seller")
        flash[:notice] = "Yeah you can Update"
      else
        flash[:notice] = "Oops! Its only for Admin Use"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
  def match_seller
    @id = (params[:id]).to_i
    @product = Product.find(@id)
    @user_id = @product.user_id
    current_user.id.eql?(@user_id)
  end
  def check_seller_for_update
    if match_seller
      flash[:notice] = "Yeah you can Update"
    else
      flash[:notice] = "Sorry you can not update this Product "
      redirect_to user_products_path
    end
  end
end