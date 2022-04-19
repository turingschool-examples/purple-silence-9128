require 'rails_helper'

RSpec.describe 'books show page', type: :feature do
  it 'has the books name, genre and authors'  do
    library = Library.create!(name: "Milton Public Library")

    book1 = library.books.create!(title: "Eat Good Food", genre: "Travel")
    book2 = library.books.create!(title: "A History of Africa", genre: "history")

    author1 = Author.create!(name: "James McFace", birth_year: "1971")
    author2 = Author.create!(name: "Angela Noseberry", birth_year: "1980")
    author3 = Author.create!(name: "Shelly Farminghoe", birth_year: "1954")
    author4 = Author.create!(name: "Percy Norris Cheesecake", birth_year: "1973")

    BookAuthor.create!(book: book1, author: author1)
    BookAuthor.create!(book: book1, author: author4)
    BookAuthor.create!(book: book2, author: author2)
    BookAuthor.create!(book: book2, author: author3)
    BookAuthor.create!(book: book2, author: author4)

    visit "/books/#{book2.id}"
    expect(page).to have_content(book2.title)
    expect(page).to have_content(book2.genre)
    expect(page).to have_content(author2.name)
    expect(page).to have_content(author3.name)
    expect(page).to have_content(author4.name)
    expect(page).to have_content(library.name)
    expect(page).not_to have_content(book1.title)
    expect(page).not_to have_content(author1.name)
  end
end
