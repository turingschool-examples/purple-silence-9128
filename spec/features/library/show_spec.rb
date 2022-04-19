require 'rails_helper'

RSpec.describe "Book Show page" do
    before :each do 
        @lib = Library.create!(name: "DCL")
        @book1 = @lib.books.create!(title: "Where Red Fern", genre: 'fiction')
        @book2 = @lib.books.create!(title: "WW2", genre: 'history')
        @book3 = @lib.books.create!(title: "King Tut", genre: 'nonfiction')
        @book4 = @lib.books.create!(title: "Cook book", genre: 'cookbook')
        @author1 = Author.create!(name: "Rick", birth_year: 1990)
        @author2 = Author.create!(name: "Tom", birth_year: 1992)
        @author3 = Author.create!(name: "Betty", birth_year: 1975)
        BookAuthor.create!(book_id: @book1.id, author_id: @author1.id)
        BookAuthor.create!(book_id: @book1.id, author_id: @author2.id)
        BookAuthor.create!(book_id: @book2.id, author_id: @author2.id)
        BookAuthor.create!(book_id: @book3.id, author_id: @author3.id)
        BookAuthor.create!(book_id: @book4.id, author_id: @author1.id)
        BookAuthor.create!(book_id: @book4.id, author_id: @author2.id)
        BookAuthor.create!(book_id: @book2.id, author_id: @author3.id)

        visit "/libraries/#{@lib.id}"
    end

    it "has name of library" do
        

    end
end 