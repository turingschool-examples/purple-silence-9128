require 'rails_helper'

RSpec.describe "library Show Page" do
  it 'shows book title and genre' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Zorple", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/libraries/#{library.id}"

    expect(page).to have_content("Beaverton Public Library")
    expect(page).to have_link("This Library's Authors")

  end

  it 'link to librarys authors links to librarys authors' do

    library = Library.create!(name:"Beaverton Public Library")
    book = library.books.create!(title:"The Greatest Zone", genre:"Autobiography", )
    author1 = Author.create!(name:"Drew Proebstel", birth_year:1995)
    author2 = Author.create!(name:"Dagbart Zorple", birth_year:1922)
    author_book1 = AuthorBook.create!(author_id: author1.id, book_id: book.id)
    author_book2 = AuthorBook.create!(author_id: author2.id, book_id: book.id)

    visit "/libraries/#{library.id}"
    click_link ("This Library's Authors")
    save_and_open_page

    expect(page).to have_current_path("/libraries/#{library.id}/authors")
  end
end
