require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to(:library) }
    it { should have_many(:author_books) }
    it { should have_many(:authors).through(:author_books) }
  end

  describe 'methods' do
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

    it 'displays book authors' do

    expect(@book1.all_authors[0].name).to eq(@author1.name)
    expect(@book1.all_authors[1].name).to eq(@author3.name)
    end
    it 'displays book authors average age' do

    expect(@book1.average_author_age).to eq(46)

    end
  end
end
