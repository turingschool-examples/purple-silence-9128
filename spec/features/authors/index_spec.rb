require 'rails_helper'

describe 'author index page' do
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
      birth_year: DateTime.new(1987)
    )
    @author_2 = Author.create!(
      name: "Great Silly Guy",
      birth_year: DateTime.new(2002)
    )
    @author_3 = Author.create!(
      name: "Not A Good Guy",
      birth_year: DateTime.new(1887)
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

    visit "/libraries/#{@library_1.id}/authors"
  end

  it 'shows a list of unique authors associated with that library' do
    # When I click on that link
    # I am taken to a Library's authors index page
    # and I can see a unique list of names of all the authors that this library has
    expect(page).to have_content("Smart Happy Guy", count: 1)
    expect(page).to have_content("Great Silly Guy", count: 1)

    expect(page).not_to have_content("Not A Good Guy")
  end
end
