class BooksController < ApplicationsController

  def show
    @book = Book.find(params[:id])
  end
end
