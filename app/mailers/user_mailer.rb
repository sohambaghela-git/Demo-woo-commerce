class UserMailer < ApplicationMailer	
	def welcome 
		@greeting = "good morning"
		mail to: "himanshu60.k@gmail.com"
	end
end
