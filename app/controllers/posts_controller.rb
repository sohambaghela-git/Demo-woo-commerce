class PostsController < ApplicationController
	def index 
		@posts=Post.all
	end

	def show
		@post=Post.find(params[:id])

	end

	def new
		@id=params[:id]
		puts @id
		@post=Post.new
	end
	def create 
		@post=Post.new(post_param)
		if @post.save 
			redirect_to :uploaded
		else
			render :new, status: :unprocessable_entity
		end
	end

	private 
	def post_param 
		params.require(:post).permit(:product_name, :detail, :image, :price)
	end


end
