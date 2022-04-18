require 'rails_helper'

RSpec.describe 'book show page' do
  it 'has a show page with book name/genre, library and authors' do
    library = Library.create!(name: 'Moscow Public Library')
    author = Author.create!(name: 'Archie Long Fur', birth_year: 1990)
    author_2 = Author.create!(name: 'Luna Twoolie', birth_year: 1992)
    book = library.books.create!(title: "A Dogs World", genre: "Kids")
    author_book = AuthorsBook.create!(book_id: book.id, author_id: author.id)
    author_book = AuthorsBook.create!(book_id: book.id, author_id: author_2.id)

    visit "/libraries/#{library.id}/books/#{book.id}"
    expect(page).to have_content("Moscow Public Library")
    expect(page).to have_content("Archie Long Fur")
    expect(page).to have_content("Luna Twoolie")
    expect(page).to have_content("A Dogs World")
    expect(page).to have_content("Kids")
  end

  it 'has a show page with book name/genre, library and authors' do
    library = Library.create!(name: 'Moscow Public Library')
    author = Author.create!(name: 'Archie Long Fur', birth_year: 1990)
    author_2 = Author.create!(name: 'Luna Twoolie', birth_year: 1992)
    book = library.books.create!(title: "A Dogs World", genre: "Kids")
    author_book = AuthorsBook.create!(book_id: book.id, author_id: author.id)
    author_book = AuthorsBook.create!(book_id: book.id, author_id: author_2.id)

    visit "/libraries/#{library.id}/books/#{book.id}"
    expect(page).to have_content("Authors Average Age: 31")
  end
end
