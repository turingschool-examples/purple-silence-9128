class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
  end
end
