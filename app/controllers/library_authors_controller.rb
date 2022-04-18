class LibraryAuthorsController < ApplicationController

  def index
    @library = Library.find(params[:library_id])
    @authors = @library.find_authors
  end
end
