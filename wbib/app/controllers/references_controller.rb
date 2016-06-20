class ReferencesController < ApplicationController

	# Get /references
	def index
		@references = Reference.all
	end
end
