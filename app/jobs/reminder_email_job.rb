class ReminderEmailJob < ActiveJob::Base
	queue_as :default

	def perform(user, document)
		@user = user
		@document = document
		UserMailer.reminder_email(@user, @document).deliver_later(wait: 1.minute)
	end

end