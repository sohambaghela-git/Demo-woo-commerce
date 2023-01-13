# Order Controller for all orders od Customer
class OrdersController < ApplicationController
	# To check User is Logged_in or Not
	before_action :check_user_authentication

	def index
		@orders = []
    @orders << Order.where(user_id: current_user.id)
    @orders = @orders.flatten
    @user = params[:user_id]
    @user_detail = User.find(@user)
	end

	def show
	end

	def new
		@order = params
		@product = Product.find(params[:product_id])
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.product_id = (params[:product_id])
		if @order.save
			redirect_to root_path
		else
			redirect_to new_user_product_order
		end
	end

	private
	def generate_transaction_id
		@order.transaction_id = SecureRandom.hex(10)
	end

	def order_params
		params.require(:order).permit!
	end
end