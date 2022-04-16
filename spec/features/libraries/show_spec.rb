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

    visit "/libraries/#{@library_1.id}"
  end

  it 'Shows the library name and link to the author index' do
    # Story 3 of 3
    # As a visitor
    # When I visit a Library's show page
    # I see the name of that library
    # and i see a link to view all of the authors that have written books that the library has
    expect(page).to have_content('Library One')
    expect(page).not_to have_content('Free Book Place')

    click_link("Library One's Authors")
    expect(current_path).to eq("/libraries/#{@library_1.id}/authors")
    # When I click on that link
    # I am taken to a Library's authors index page
    # and I can see a unique list of names of all the authors that this library has

  end
end
