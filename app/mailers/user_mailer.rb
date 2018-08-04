class UserMailer < ApplicationMailer

	def reminder_email(user, document)
		@user = user
		@document = document
		mail(to: @user.email, subject: 'Deadline Reminder')
	end
end 
