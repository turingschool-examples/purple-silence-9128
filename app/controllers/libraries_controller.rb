class LibrariesController < ApplicationController

  def show
    @library = Library.find(params[:library_id])
  end
end
