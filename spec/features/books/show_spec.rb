require 'rails_helper'

RSpec.describe 'Books Show Page' do
  before do
    @library_1 = Library.create!(name: 'Aurora')
    @library_2 = Library.create!(name: 'Denver')
    @library_3 = Library.create!(name: 'Chandler')

    @book_1 = @library_1.books.create!(title: 'Tick', genre: 'fiction' )
    @book_2 = @library_2.books.create!(title: 'Tock', genre: 'mystery' )
    @book_3 = @library_3.books.create!(title: 'Tuck', genre: 'horror' )
    @book_4 = @library_1.books.create!(title: 'Tack', genre: 'fiction' )
    @book_5 = @library_1.books.create!(title: 'Clock', genre: 'fiction' )
    @book_6 = @library_2.books.create!(title: 'Cluck', genre: 'non fiction' )
    @book_7 = @library_3.books.create!(title: 'Block', genre: 'cooking' )
    @book_8 = @library_1.books.create!(title: 'Flock', genre: 'hunting' )

    @auth_1 = Author.create!(name: 'Writer', birth_year: 1952)
    @auth_2 = Author.create!(name: 'Reader', birth_year: 1982)
    @auth_3 = Author.create!(name: 'Windy', birth_year: 2002)
    @auth_4 = Author.create!(name: 'Ernest', birth_year: 1992)

    @ba_1 = BookAuthor.create!(book: @book_1, author: @auth_4)
    @ba_2 = BookAuthor.create!(book: @book_8, author: @auth_1)
    @ba_3 = BookAuthor.create!(book: @book_4, author: @auth_3)
    @ba_4 = BookAuthor.create!(book: @book_5, author: @auth_4)
    @ba_5 = BookAuthor.create!(book: @book_3, author: @auth_2)
    @ba_6 = BookAuthor.create!(book: @book_4, author: @auth_4)

    visit "/books/#{@book_4.id}"
  end
   it 'I see the books name and genre' do
     expect(page).to have_content(@book_4.title)
     expect(page).to have_content(@book_4.genre)
   end

   it 'I see a list of the authors for that book' do
     expect(page).to have_content('Windy')
     expect(page).to have_content('Ernest')
   end

   it 'I see the name of the library the book belongs to' do
     expect(page).to have_content('Aurora')
   end

   it 'I see the average age of the author for that book' do
     expect(page). to have_content('25')
   end
end