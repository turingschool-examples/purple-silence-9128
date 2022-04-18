class AuthorsController < ApplicationController
  def index
    @author_names = Book.author_names_by_library((params[:library_id]))
  end
end
