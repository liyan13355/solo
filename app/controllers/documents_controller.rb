class DocumentsController < ApplicationController
	before_action :authorise, :only => [:new, :create, :show, :index]

	def new
		@document = Document.new
	end

	def create
		
		@document = Document.new(allowed_params)

		@superadmin = User.find_by(email: 'choohor@gmail.com')
		@reminder_date = @document.reminder_date
		@period = (@document.deadline - @reminder_date).to_i
		@time_till_email = (@reminder_date - Date.today).to_i
		if @document.save
			ReminderEmailJob.set(wait: @time_till_email.days).perform_later(@superadmin, @document)
			redirect_to document_path(@document.id), notice: "Your entry has been committed and a reminder email will be sent #{@period} days before the deadline."
		else
			render :new
		end
	end

	def show
		@document = Document.find(params[:id])
	end

	def index

		@search = Document.ransack(params[:q]) 
		@result = @search.result

		@documents = Document.order(:file_name)

		@documents_deadline = Document.order(:deadline)

		@documents_created = Document.order(:created_at)
	end

	def destroy
		@document = Document.find(params[:id])
		@document.destroy
		redirect_to documents_path
	end


	private

	def allowed_params
		params.require(:document).permit(:file_name, :client, :deadline, :reminder_date)
	end

end
