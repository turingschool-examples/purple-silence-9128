class AuthorsController < ApplicationController
  def index
    @lib = Library.find(params[:library_id])
    @authors = @lib.authors.distinct
  end
end