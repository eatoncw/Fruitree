class UserMailer < ApplicationMailer

	def contact_form(email, name, message)
		@message = message
		@name = name
		@email = email
			mail(:from => email,
				:to => "eaton.cw@gmail.com",
				:subject => "A new Fruitree contact form message from #{ @name }")
	end

	def welcome(user)
		@user = user
			mail(:to => user.email,
				:subject => "Welcome to Fruitree")
	end

	def flag(user, comment)
		@user = user
		@comment = comment
		mail(:to => "eaton.cw@gmail.com",
			:subject => "A comment has been flagged as inappriopriate")
	end
end
