require "rails_helper"

RSpec.describe "book show page" do
  it "has the book's name and genre, the authors for the book, and the library it belongs to" do
    author = Author.create!(name: "Douglas Adams", birth_year: 1952)
    author = Author.create!(name: "Graham Chapman", birth_year: 1954)
    library = Library.create!(name: "DPL")
    book = Book.create!(title: "Monty Python's Guide to the Universe", genre: "Satire", library_id: library.id)

    visit "/books/#{book.id}"

    expect(page).to have_content("Book: Monty Python's Guide to the Universe")
    expect(page).to have_content("Genre: Satire")
    expect(page).to have_content("Author: Douglas Adams")
    expect(page).to have_content("Author: Graham Chapman")
    expect(page).to have_content("Library: DPL")
  end
end