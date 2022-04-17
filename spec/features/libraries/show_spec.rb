require "rails_helper"

RSpec.describe "library show page" do
  xit "has the library name and a link to view all authors" do
    author_1 = Author.create!(name: "Douglas Adams", birth_year: 1952)
    author_2 = Author.create!(name: "Graham Chapman", birth_year: 1954)
    library_1 = Library.create!(name: "DPL")
    book_1 = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library.id)
    author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
    author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book_1.id)
    
    author_3 = Author.create!(name: "Douglas Adams", birth_year: 1952)
    author_4 = Author.create!(name: "Graham Chapman", birth_year: 1954)
    library_2 = Library.create!(name: "DPL")
    book = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library.id)
    author_book_1 = AuthorBook.create!(author_id: author_1.id, book_id: book.id)
    author_book_2 = AuthorBook.create!(author_id: author_2.id, book_id: book.id)
    
    visit "/libraries/#{library_1.id}"
    
    expect(page).to have_content("Book: Monty Python's Guide to the Universe")
    expect(page).to have_content("Genre: Satire")
    expect(page).to have_content("Library: DPL")
    
    within "#authors" do
      expect(page).to have_content("Douglas Adams")
      expect(page).to have_content("Graham Chapman")
    end
  end
end