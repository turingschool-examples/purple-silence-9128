require "rails_helper"

RSpec.describe "library show page" do
  it "has the library name and a link to view all authors" do
    author_1 = Author.create!(name: "Douglas Adams", birth_year: 1952)
    author_2 = Author.create!(name: "Graham Chapman", birth_year: 1954)
    library_1 = Library.create!(name: "DPL")
    book_1 = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library_1.id)
    author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
    author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book_1.id)
    
    author_3 = Author.create!(name: "Douglas Adams", birth_year: 1952)
    author_4 = Author.create!(name: "Graham Chapman", birth_year: 1954)
    library_2 = Library.create!(name: "APL")
    book = Book.create!(title: "And now for something completely different", genre: "Satire", library_id: library_2.id)
    author_book_1 = AuthorBook.create!(author_id: author_3.id, book_id: book.id)
    author_book_2 = AuthorBook.create!(author_id: author_4.id, book_id: book.id)
    
    visit "/libraries/#{library_1.id}"
    
    expect(page).to have_content("Library: DPL")
    expect(page).to_not have_content("Library: APL")
    
    click_link "All Authors"
    expect(current_path).to eq("/libraries/#{library_1.id}/authors")
  end
  
  it "has the 3 most popular authors by book count" do
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
    
    visit "/libraries/#{library_1.id}"
    
    within "#top_3_authors" do
      expect(page).to have_content("J.K Rowling")
      expect(page).to have_content("Douglas Adams")
      expect(page).to have_content("Stephen King")
      expect(page).to_not have_content("Terry Pratchett")
    end
  end
end