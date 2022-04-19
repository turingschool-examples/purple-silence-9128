require "rails_helper"

RSpec.describe "Libraries Show" do
  it 'displays library name, author links' do
    author_1 = Author.create(name: "Author One", birthyear: 1942)
    author_2 = Author.create(name: "Author Two", birthyear: 1962)
    author_3 = Author.create(name: "Author Three", birthyear: 1982)
    library_1 = Library.create(name: "Library One")
    book_1 = Book.create(title: "Book One", genre: "Genre1", library_id: library_1.id)
    book_2 = Book.create(title: "Book Two", genre: "Genre2", library_id: library_1.id)
    author_book_1 = AuthorBook.create(author_id: author_1.id, book_id: book_1.id)
    author_book_2 = AuthorBook.create(author_id: author_2.id, book_id: book_1.id)
    author_book_3 = AuthorBook.create(author_id: author_3.id, book_id: book_2.id)

    visit "/libraries/#{library_1.id}"

    expect(page).to have_content("Library One")

    click_link "Authors"
  end
end
