require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'instance methods' do
    library = Library.create!(name: 'Denver Public Library')
    book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
    author_0 = book.authors.create!(name: 'William Strunk', birth_year: 1945)
    author_1 = book.authors.create!(name: 'E.B. White', birth_year: 1950)

    book_1 = library.books.create!(title: "Grims' Fairy Tales", genre: 'Fair Tales')
    author_2 = book_1.authors.create!(name: 'Jacob Grimm', birth_year: 1800)
    author_3 = book_1.authors.create!(name: 'Wilhelm Grimm', birth_year: 1805)

    book_2 = library.books.create!(title: 'Sytles of Writing', genre: 'Style Guides')
    author_4 = book_2.authors.create!(name: 'William Strunk', birth_year: 1945)

    it 'returns a list of unique authors' do
      expect(library.unique_author_list).to eq(["E.B. White", "Jacob Grimm", "Wilhelm Grimm", "William Strunk"])
    end
  end
end
