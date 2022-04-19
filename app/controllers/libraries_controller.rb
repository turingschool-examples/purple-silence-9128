class LibrariesController < ApplicationController
  def show
    @lib = Library.find(params[:id])
  end
end