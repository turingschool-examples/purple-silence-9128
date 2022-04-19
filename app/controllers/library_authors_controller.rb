class LibraryAuthorsController < ApplicationController
  def index
    @authors = Library.find(params[:id]).authors
  end
end
