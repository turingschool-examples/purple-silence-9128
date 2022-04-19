class LibrariesController < ApplicationController

  def show
    @library = Library.find(params[:id])
  end

  def authors
    @library = Library.find(params[:id])
  end
end