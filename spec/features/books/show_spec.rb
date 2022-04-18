require 'rails_helper'

RSpec.describe "Book Show Page" do
  it 'shows price of all snacks assosiated with the vending machine and their price' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Puffylips", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/books/#{book.id}"

    expect(page).to have_content("The Greatest Zone")
    expect(page).to have_content("Autobiography")
    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Dagbart Puffylips")

  end
end
