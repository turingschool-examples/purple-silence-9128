require 'rails_helper'

RSpec.describe 'Library Show Page' do
    
    describe 'as a visitor' do
        
        it 'has the name of the library, has a link to view all authors at library' do
            lib = Library.create!(name: 'The Library')
            lib2 = Library.create!(name: 'Other Library')
            king = Author.create!(name: 'stephen king', age: 77)
            bach = Author.create!(name: 'richard bachman', age: 55)
            dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id)
            book_author1 = BookAuthor.create!(book: dark, author: king)
            book_author2 = BookAuthor.create!(book: dark, author: bach)

            holes = Book.create!(title: 'Holes', genre: 'good', library_id: lib.id)
            guy = Author.create!(name: 'guy mcauthor', age: 37)
            book_author3 = BookAuthor.create!(book: holes, author: guy)

            time = Book.create!(title: 'Children of Time', genre: 'sci fi', library_id: lib.id)
            writer = Author.create!(name: 'writer mcbookface', age: 23)
            pen_name = Author.create!(name: 'sneaky sneak', age: 49)
            cheese = Author.create!(name: 'just somecheese', age: 26)
            book_author4 = BookAuthor.create!(book: time, author: writer)
            book_author5 = BookAuthor.create!(book: time, author: pen_name)
            book_author6 = BookAuthor.create!(book: time, author: cheese)

            visit "/libraries/#{lib.id}"
            # save_and_open_page
            expect(page).to have_content("The Library")
            expect(page).to have_link("See All Authors Featured Here")
            expect(page).to_not have_content("Other Library")
        end

        it 'clicking link brings to that lib lib_authors index, unique authors shown' do
            lib = Library.create!(name: 'The Library')
            lib2 = Library.create!(name: 'Other Library')
            king = Author.create!(name: 'stephen king', age: 77)
            bach = Author.create!(name: 'richard bachman', age: 55)
            dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id)
            book_author1 = BookAuthor.create!(book: dark, author: king)
            book_author2 = BookAuthor.create!(book: dark, author: bach)

            holes = Book.create!(title: 'Holes', genre: 'good', library_id: lib.id)
            guy = Author.create!(name: 'guy mcauthor', age: 37)
            book_author3 = BookAuthor.create!(book: holes, author: guy)
            book_author7 = BookAuthor.create!(book: holes, author: king)

            time = Book.create!(title: 'Children of Time', genre: 'sci fi', library_id: lib.id)
            writer = Author.create!(name: 'writer mcbookface', age: 23)
            pen_name = Author.create!(name: 'sneaky sneak', age: 49)
            cheese = Author.create!(name: 'just somecheese', age: 26)
            book_author4 = BookAuthor.create!(book: time, author: writer)
            book_author5 = BookAuthor.create!(book: time, author: pen_name)
            book_author6 = BookAuthor.create!(book: time, author: cheese)

            other = Book.create!(title: 'other book', genre: 'fake', library_id: lib2.id)
            fake = Author.create!(name: 'fake mcauthorpants', age: 7)
            book_author5 = BookAuthor.create!(book: other, author: fake)


            visit "/libraries/#{lib.id}"
            
            click_link "See All Authors Featured Here"
            expect(current_path).to eq("/libraries/#{lib.id}/authors")
            
            expect(page).to have_content('stephen king')
            expect(page).to have_content('richard bachman')
            expect(page).to have_content('guy mcauthor')
            expect(page).to have_content('writer mcbookface')
            expect(page).to have_content('just somecheese')
            
            expect(page).to_not have_content("#{fake.name}")
        end         



    end
end 