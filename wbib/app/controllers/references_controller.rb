class ReferencesController < ApplicationController

	# GET /references/new
	def new
		@reference = Reference.new
	end

	# Get /references/1/edit
	def edit
		@reference = Reference.find(params[:id])
	end

	# GET /references
	def index
		@references = Reference.all
	end

	# GET /references/1
	def show
		@reference = Reference.find(params[:id])
	end

	# POST /references
	def create
		@reference = Reference.new(params.require(:reference).permit(:url, :topic, :annotation, :timedate))
		
		if @reference.save
			redirect_to @reference, notice: 'Reference Successfully Created'
		else
			render :new
		end
	end

	# PATCH /references/1
	def update
		@reference = Reference.find(params[:id])
		if @reference.update(params.require(:reference).permit(:url, :topic, :annotation, :timedate))
			redirect_to @reference, notice: 'Reference Successfully Updated'
		else
			render :edit
		end
	end
end
