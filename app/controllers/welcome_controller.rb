# root or welcome controller 
class WelcomeController < ApplicationController
	def welcome
    @products = Product.all
	end
end
