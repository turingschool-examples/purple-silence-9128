class LibraryAuthorsController < ApplicationController
	def index
		library = Library.find(params[:id])
		@authors = library.authors.distinct
	end
end