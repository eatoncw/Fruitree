class UserMailer < ApplicationMailer

	def contact_form(email, name, message)
		@message = message
		@name = name
		@email = email
			mail(:from => email,
				:to => 'eaton.cw@gmail.com',
				:subject => 'A new Fruitree contact form message from #{ @name }')
	end
end
