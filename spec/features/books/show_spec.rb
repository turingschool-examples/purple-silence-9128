require 'rails_helper'

describe 'invoice show page' do
  before do
    @library_1 = Library.create!(name: "Library One")
    @library_2 = Library.create!(name: "Free Book Place")

    @book_1 = @library_1.books.create!(
      title: "Book On Livin'",
      genre: "Self Help"
    )
    @book_2 = @library_1.books.create!(
      title: "Book On Dyin'",
      genre: "Horror"
    )
    @book_3 = @library_2.books.create!(
      title: "Nothing Book",
      genre: "Nothing"
    )

    @author_1 = Author.create!(
      name: "Smart Happy Guy",
      age: 35
    )
    @author_2 = Author.create!(
      name: "Great Silly Guy",
      age: 20
    )
    @author_3 = Author.create!(
      name: "Not A Good Guy",
      age: 125
    )

    @book_author_1 = BookAuthor.create!(
      book_id: @book_1.id,
      author_id: @author_1.id,
    )
    @book_author_2 = BookAuthor.create!(
      book_id: @book_1.id,
      author_id: @author_2.id,
    )
    @book_author_3 = BookAuthor.create!(
      book_id: @book_2.id,
      author_id: @author_2.id,
    )
    @book_author_4 = BookAuthor.create!(
      book_id: @book_3.id,
      author_id: @author_3.id,
    )

    visit "/books/#{@book_1.id}"
  end

  it 'shows the books name and genre' do
    expect(page).to have_content("Book On Livin'")
    expect(page).to have_content("Self Help")
    expect(page).not_to have_content("Book On Dyin'")
    expect(page).not_to have_content("Horror")
  end
  # Story 1 of 3
  # As a visitor, when I visit a book's show page
  # I see the book's name and genre
  # And I see a list of authors for that book.
  # And I see the name of the Library it belongs to
end
