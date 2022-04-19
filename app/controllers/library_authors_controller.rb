class LibraryAuthorsController < ApplicationController
  def index
    @library = Library.find(params[:id])
    @library_books = @library.books
    @authors = @library_books.author
    require "pry"; binding.pry
  end
end