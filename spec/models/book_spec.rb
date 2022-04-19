require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :author_books }
    it { should have_many(:authors).through(:author_books) }
  end

  describe 'methods' do
    it 'will return the names of all authors' do
      author_1 = Author.create(name: "Author One", birthyear: 1942)
      author_2 = Author.create(name: "Author Two", birthyear: 1962)
      library_1 = Library.create(name: "Library One")
      book_1 = Book.create(title: "Book One", genre: "Genre1", library_id: library_1.id)
      author_book_1 = AuthorBook.create(author_id: author_1.id, book_id: book_1.id)
      author_book_2 = AuthorBook.create(author_id: author_2.id, book_id: book_1.id)

      expect(book_1.authors_name).to eq(["Author One", "Author Two"])
    end
  end


end
