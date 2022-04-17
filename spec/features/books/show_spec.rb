require 'rails_helper'

RSpec.describe 'Book Show Page' do
    
    describe 'as a visitor' do

        it 'Has the books attributes, authors, and library its at' do

            lib = Library.create!(name: 'The Library')
            lib2 = Library.create!(name: 'Other Library')
            king = Author.create!(name: 'stephen king', age: 77)
            bach = Author.create!(name: 'richard bachman', age: 55)
            dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id)
            book_author1 = BookAuthor.create!(book: dark, author: king)
            book_author2 = BookAuthor.create!(book: dark, author: bach)
            
            visit "/books/#{dark.id}"
            # save_and_open_page
            expect(page).to have_content("Dark Tower")
            expect(page).to have_content("fantasy")
            expect(page).to have_content("Author Name: stephen king")
            expect(page).to have_content("Author Name: richard bachman")
            expect(page).to have_content("At Library: The Library")
            expect(page).to_not have_content("Other Library")

        end

        it 'Has the average age of the authors' do
                       lib = Library.create!(name: 'The Library')
            lib2 = Library.create!(name: 'Other Library')
            king = Author.create!(name: 'stephen king', age: 77)
            bach = Author.create!(name: 'richard bachman', age: 55)
            dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id)
            book_author1 = BookAuthor.create!(book: dark, author: king)
            book_author2 = BookAuthor.create!(book: dark, author: bach)
            
            visit "/books/#{dark.id}"
            expect(page).to have_content("Authors Average Age: 66")
        end




    end 
end