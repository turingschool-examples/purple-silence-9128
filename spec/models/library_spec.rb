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

    it "#top_3_authors" do
    library_1 = Library.create!(name: "DPL")

    # 3 books for author_1
    author_1 = Author.create!(name: "Douglas Adams", birth_year: 1952)
    book_1 = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library_1.id)
    book_2 = Book.create!(title: "Book 2", genre: "Satire", library_id: library_1.id)
    book_3 = Book.create!(title: "Book 3", genre: "Satire", library_id: library_1.id)
    author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
    author_book_2 = AuthorBook.create!(author_id: author_1.id, book_id: book_2.id)
    author_book_3 = AuthorBook.create!(author_id: author_1.id, book_id: book_3.id)
    
    # 1 book for author_2
    author_2 = Author.create!(name: "Terry Pratchett", birth_year: 1952)
    book_4 = Book.create!(title: "The Color of Magic", genre: "Satire", library_id: library_1.id)
    author_book_4 = AuthorBook.create!(author_id: author_2.id, book_id: book_4.id)
    
    # 2 books for author_3
    author_3 = Author.create!(name: "Stephen King", birth_year: 1952)
    book_5 = Book.create!(title: "Dark Tower", genre: "Adventure/Horror", library_id: library_1.id)
    book_6 = Book.create!(title: "Wolves of the Calla", genre: "Adventure/Horror", library_id: library_1.id)
    author_book_5 = AuthorBook.create!(author_id: author_3.id, book_id: book_5.id)
    author_book_6 = AuthorBook.create!(author_id: author_3.id, book_id: book_6.id)
    
    # 4 books for author_4
    author_4 = Author.create!(name: "J.K Rowling", birth_year: 1952)
    book_7 = Book.create!(title: "Sorcerer's Stone", genre: "Adventure/Horror", library_id: library_1.id)
    book_8 = Book.create!(title: "Chamber of Secrets", genre: "Adventure/Horror", library_id: library_1.id)
    book_9 = Book.create!(title: "Prisonzer of Azkaban", genre: "Adventure/Horror", library_id: library_1.id)
    book_10 = Book.create!(title: "Goblet of Fire", genre: "Adventure/Horror", library_id: library_1.id)
    author_book_7 = AuthorBook.create!(author_id: author_4.id, book_id: book_7.id)
    author_book_8 = AuthorBook.create!(author_id: author_4.id, book_id: book_8.id)
    author_book_9 = AuthorBook.create!(author_id: author_4.id, book_id: book_9.id)
    author_book_10 = AuthorBook.create!(author_id: author_4.id, book_id: book_10.id)
    
    expect(library_1.top_3_authors).to eq([author_4, author_1, author_3])
    end
  end
end
