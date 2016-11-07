# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_form
		UserMailer.contact_form("john@example.com", "John", "Hello World!")
	end

	def welcome
		UserMailer.welcome(@user = User.find(5))
	end

	def flag
		UserMailer.flag(@user = User.last, @comment = Comment.last)
	end

end
