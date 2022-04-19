class BooksController < ApplicationController
  def show
    @library = Library.find(params[:id])
    @book = Book.find(params[:id])
  end
end
