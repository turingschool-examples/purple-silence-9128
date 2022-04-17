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
end