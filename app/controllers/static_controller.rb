class StaticController < ApplicationController 
	
	layout "landing"
	
	def landingpage
	end

	def contact
	end

	def thank_you
		@name = params[:thank_you][:name]
		@email = params[:thank_you][:email]
		@message = params[:thank_you][:message]

		#work-around for client side validation (without a gem for this)
		#as these params have no model for validation
		if @name.length < 3 || @email.length < 3 || @message.length < 5 
			flash.now[:danger] = "Not enough info has been provided"
			render :contact
		else
			ActionMailer::Base.mail(:from => @email,
				:to => 'eaton.cw@gmail.com',
				:subject => "A new contact form message from #{@name}",
				:body => @message).deliver_later
		end

	end
	
end
