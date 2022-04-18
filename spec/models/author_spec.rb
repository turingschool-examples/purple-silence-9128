require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    @lib1 = Library.create!(name: 'John')
    @lib2 = Library.create!(name: 'Paul')

    @book1 = @lib1.books.create!(title: 'The Hobbit', genre: 'Fantasy')
    @book2 = @lib2.books.create!(title: 'The Hitchhickers Guide', genre: 'Sci-fi')

    @author1 = Author.create!(name: 'J.R.R. Tolkin', birth_year: 1910)
    @author2 = Author.create!(name: 'Douglas Adams', birth_year: 1950)
#    @author3 = Author.create!(name: 'Some guy', birth_year: 2000)

    @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
    @author_book2 = AuthorBook.create!(author: @author2, book: @book1)
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
  end

  describe 'relationships' do
    it { should have_many :author_books }
    it { should have_many(:books).through(:author_books) }
  end

  describe 'class methods' do
    it '#average_author_age' do
      expect(Author.average_author_age.to_i).to eq(92)

    end
  end
end
