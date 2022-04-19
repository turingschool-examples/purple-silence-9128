require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'class methods' do
    library_1 = Library.create!(name: 'Aurora')
    library_2 = Library.create!(name: 'Denver')
    library_3 = Library.create!(name: 'Chandler')

    book_1 = library_1.books.create!(title: 'Tick', genre: 'fiction' )
    book_2 = library_2.books.create!(title: 'Tock', genre: 'mystery' )
    book_3 = library_3.books.create!(title: 'Tuck', genre: 'horror' )
    book_4 = library_1.books.create!(title: 'Tack', genre: 'fiction' )
    book_5 = library_1.books.create!(title: 'Clock', genre: 'fiction' )
    book_6 = library_2.books.create!(title: 'Cluck', genre: 'non fiction' )
    book_7 = library_3.books.create!(title: 'Block', genre: 'cooking' )
    book_8 = library_1.books.create!(title: 'Flock', genre: 'hunting' )

    auth_1 = Author.create!(name: 'Writer', birth_year: 1952)
    auth_2 = Author.create!(name: 'Reader', birth_year: 1982)
    auth_3 = Author.create!(name: 'Windy', birth_year: 2002)
    auth_4 = Author.create!(name: 'Ernest', birth_year: 1992)

    ba_1 = BookAuthor.create!(book: book_1, author: auth_4)
    ba_2 = BookAuthor.create!(book: book_8, author: auth_1)
    ba_3 = BookAuthor.create!(book: book_4, author: auth_3)
    ba_4 = BookAuthor.create!(book: book_5, author: auth_4)
    ba_5 = BookAuthor.create!(book: book_3, author: auth_2)
    ba_6 = BookAuthor.create!(book: book_4, author: auth_4)

    it 'can return the authors average age' do

      expect(Author.authors_average_age).to eq(40)
    end
  end
end