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
		@documents = Document.order(:file_name)
	end


	private

	def allowed_params
		params.require(:document).permit(:file_name, :client, :deadline)
	end

end
