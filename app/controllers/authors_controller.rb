class AuthorsController < ApplicationController

  def index
    @authors = Library.find(params[:library_id]).authors.distinct
  end
end
