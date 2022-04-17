require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  
  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:authors).through :books }
  end

  describe "instance methods" do
    it "#unique_author_names" do
      author_1 = Author.create!(name: "Douglas Adams", birth_year: 1952)
      author_2 = Author.create!(name: "Graham Chapman", birth_year: 1954)
      library_1 = Library.create!(name: "DPL")
      book_1 = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library_1.id)
      author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
      author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book_1.id)
      
      author_3 = Author.create!(name: "Douglas Adams", birth_year: 1952)
      author_4 = Author.create!(name: "Graham Chapman", birth_year: 1954)
      book = Book.create!(title: "And now for something completely different", genre: "Satire", library_id: library_1.id)
      author_book_1 = AuthorBook.create!(author_id: author_3.id, book_id: book.id)
      author_book_2 = AuthorBook.create!(author_id: author_4.id, book_id: book.id)
      
      expect(library_1.unique_author_names).to eq(["Douglas Adams", "Graham Chapman"])
    end
  end
end