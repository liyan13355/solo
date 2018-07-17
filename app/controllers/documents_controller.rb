class DocumentsController < ApplicationController
	before_action :authorise, :only => [:new, :create, :show, :index]

	def new
		@document = Document.new
	end

	def create
		
		@document = Document.new(allowed_params)
		if @document.save
			redirect_to document_path(@document.id), notice: 'Your entry has been committed'
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
		params.require(:document).permit(:file_name, :client, :deadline)
	end

end
