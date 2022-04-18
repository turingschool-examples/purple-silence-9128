require 'rails_helper'

RSpec.describe "Book Show Page" do
  it 'shows book title and genre' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Zorple", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/books/#{book.id}"
    save_and_open_page

    expect(page).to have_content("The Greatest Zone")
    expect(page).to have_content("Autobiography")
    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Dagbart Zorple")

  end
  it 'shows all authors names' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Zorple", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/books/#{book.id}"

    expect(page).to have_content("Drew Proebstel")
    expect(page).to have_content("Dagbart Zorple")

  end
  it 'average author age' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Zorple", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/books/#{book.id}"
    expect(page).to have_content("#{((Time.now.year * 2) - author1.birth_year - author2.birth_year)/2}")

  end
end
