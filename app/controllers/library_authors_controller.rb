class LibraryAuthorsController < ApplicationController

    def index
        @library = Library.find(params[:id])
        @books = @library.authors
    end
    

end