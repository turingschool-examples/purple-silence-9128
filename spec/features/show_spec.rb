require "rails_helper"

RSpec.describe "Books Show" do
  it 'displays a list of all of books authors and genre' do
    author_1 = Author.create(name: "Author One", birth_year: 1942)
    author_2 = Author.create(name: "Author Two", birth_year: 1962)
    author_3 = Author.create(name: "Author Three", birth_year: 1982)
    book_1 = Book.create(title: "Book One", genre: "Genre1", library_id: library_1.id)
    book_2 = Book.create(title: "Book Two", genre: "Genre2", library_id: library_1.id)
    library_1 = Library.create(name: "Library One")
    author_book_1 = AuthorBook.create(author_id: author_1.id, book_id: book_1.id)
    author_book_2 = AuthorBook.create(author_id: author_2.id, book_id: book_1.id)
    author_book_3 = AuthorBook.create(author_id: author_3.id, book_id: book_2.id)

    visit "/books/#{book_1.id}"

    expect(page).to have_content("Author One")
    expect(page).to have_content("Author Two")
    expect(page).to have_content("Genre1")
  end
