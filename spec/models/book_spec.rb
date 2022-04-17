require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end
  
  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end 

  describe 'methods' do
    
    it 'returns the average age of a books authors' do
      lib = Library.create!(name: 'The Library')
      king = Author.create!(name: 'stephen king', age: 77)
      bach = Author.create!(name: 'richard bachman', age: 55)
      guy = Author.create!(name: 'guy mcauthor', age: 36)
      dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id)
      book_author1 = BookAuthor.create!(book: dark, author: king)
      book_author2 = BookAuthor.create!(book: dark, author: bach)
      book_author3 = BookAuthor.create!(book: dark, author: guy)
      expect(dark.authors_average_age).to eq(56)
    end



  end
end