require 'rails_helper'

RSpec.describe "Book Show page" do

    it 'displays the books name and genre' do 
        lib = Library.create!(name: "DCL")
        @book1 = lib.books.create!(title: "Where Red Fern", genre: 'fiction')
        @author1 = Author.create!(name: "Rick", birth_year: 1990)
        @author2 = Author.create!(name: "Tom", birth_year: 1992)
        BookAuthor.create(book_id: @book1.id, author_id: @author1.id)
        BookAuthor.create(book_id: @book1.id, author_id: @author2.id)

        visit "/books/#{@book1.id}"

        expect(page).to have_content("Where Red Fern")
        expect(page).to have_content("fiction")
        within("#authors") do
            expect(page).to have_content("Rick")
            expect(page).to have_content("Tom")
        end
        expect(page).to have_content("Library: DCL")
    end

    it 'displays the average age of the authors'do 
        lib = Library.create!(name: "DCL")
        @book1 = lib.books.create!(title: "Where Red Fern", genre: 'fiction')
        @author1 = Author.create!(name: "Rick", birth_year: 1990)
        @author2 = Author.create!(name: "Tom", birth_year: 1992)
        BookAuthor.create(book_id: @book1.id, author_id: @author1.id)
        BookAuthor.create(book_id: @book1.id, author_id: @author2.id)

        visit "/books/#{@book1.id}"
        expect(page).to have_content("Average age: 31")
    end 
end