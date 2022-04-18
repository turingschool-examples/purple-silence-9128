class AuthorsController < ApplicationController
  def index
    @library = Library.find(params[:library_id])
    @authors = @library.authors
  end
end
