class BooksController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
    @library = Library.find(params[:library_id])
    require "pry"; binding.pry
  end
end
