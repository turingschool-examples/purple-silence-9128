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

  describe "instance methods" do
    it "#author_names" do
      author_1 = Author.create!(name: "Douglas Adams", birth_year: 1952)
      author_2 = Author.create!(name: "Graham Chapman", birth_year: 1954)
      library = Library.create!(name: "DPL")
      book = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library.id)
      author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book.id)
      author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book.id)

      expect(book.author_names).to eq(["Douglas Adams", "Graham Chapman"])
    end

    it "#average_author_age" do
      author_1 = Author.create!(name: "Douglas Adams", birth_year: 2018)
      author_2 = Author.create!(name: "Graham Chapman", birth_year: 2020)
      author_2 = Author.create!(name: "Graham Chapman", birth_year: 2016)
      library = Library.create!(name: "DPL")
      book = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library.id)
      author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book.id)
      author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book.id)
    
      expect(book.average_author_age).to eq(5)
    end
  end
end