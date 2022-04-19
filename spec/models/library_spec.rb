require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe "Library Authors", type: :model do
    before(:each) do
      @library1 = Library.create!(name: "The Library")
      @book1 = Book.create!(title: "Good Book", genre: "Mystery", library: @library1)
      @author1 = Author.create!(name: "Good Author", age: 41)
      @author3 = Author.create!(name: "Best Author", age: 51)
      @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
      @author_book3 = AuthorBook.create!(author: @author3, book: @book1)

      @library2 = Library.create!(name: "Cursed Library")
      @book2 = Book.create!(title: "Bad Book", genre: "Horror", library: @library1)
      @author2 = Author.create!(name: "Bad Author", age: 31)
      @author_book2 = AuthorBook.create!(author: @author2, book: @book2)
    end

    it 'returns all authors' do
      @library1.all_library_authors
    end
  end
end
