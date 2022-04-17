require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  
  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'methods' do

    it 'returns a unique list of authors for a given library' do
      
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

      expect(lib.authors).to eq(["guy mcauthor", "just somecheese", "richard bachman", "sneaky sneak", "stephen king", "writer mcbookface"])

    end

  end 
end 