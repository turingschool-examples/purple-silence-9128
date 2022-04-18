require 'rails_helper'

RSpec.describe 'library show page' do
  it 'has a show page with library name' do
    library = Library.create!(name: 'Moscow Public Library')
    author = Author.create!(name: 'Archie Long Fur', birth_year: 1990)
    author_2 = Author.create!(name: 'Luna Twoolie', birth_year: 1992)
    book = library.books.create!(title: "A Dogs World", genre: "Kids")
    book_2 = library.books.create!(title: "A Cats World", genre: "Kids")
    author_book_1 = AuthorsBook.create!(book_id: book.id, author_id: author.id)
    author_book_2 = AuthorsBook.create!(book_id: book.id, author_id: author_2.id)
    author_book_3 = AuthorsBook.create!(book_id: book_2.id, author_id: author_2.id)

    visit "/libraries/#{library.id}"

    expect(page).to have_content(library.name)
  end

  it 'has a link to libary authors index page and lists unique authors' do
    library = Library.create!(name: 'Moscow Public Library')
    author = Author.create!(name: 'Archie Long Fur', birth_year: 1990)
    author_2 = Author.create!(name: 'Luna Twoolie', birth_year: 1992)
    book = library.books.create!(title: "A Dogs World", genre: "Kids")
    book_2 = library.books.create!(title: "A Cats World", genre: "Kids")
    author_book_1 = AuthorsBook.create!(book_id: book.id, author_id: author.id)
    author_book_2 = AuthorsBook.create!(book_id: book.id, author_id: author_2.id)
    author_book_3 = AuthorsBook.create!(book_id: book_2.id, author_id: author_2.id)

    library_2 = Library.create!(name: 'Denver Public Library')
    author_3 = Author.create!(name: 'Purple Eater', birth_year: 1990)
    author_4 = Author.create!(name: 'Orange Eater', birth_year: 1992)
    book_3 = library_2.books.create!(title: "Catepillar", genre: "Kids")
    book_4 = library_2.books.create!(title: "Moth", genre: "Kids")
    author_book_4 = AuthorsBook.create!(book_id: book_3.id, author_id: author_3.id)
    author_book_5 = AuthorsBook.create!(book_id: book_3.id, author_id: author_4.id)
    author_book_6 = AuthorsBook.create!(book_id: book_4.id, author_id: author_4.id)

    visit "/libraries/#{library.id}"
    click_link "View Authors"
    expect(current_path).to eq("/libraries/#{library.id}/authors")
    expect(page).to have_content("Archie Long Fur")
    expect(page).to have_content("Luna Twoolie")
    expect(page).to_not have_content("Purple Eater")
    expect(page).to_not have_content("Orange Eater")

  end
end
