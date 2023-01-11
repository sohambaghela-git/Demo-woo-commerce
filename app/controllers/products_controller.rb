# Product Class for Customer and Admin
class ProductsController < ApplicationController
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
end