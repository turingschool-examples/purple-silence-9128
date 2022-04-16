require 'rails_helper'

describe 'book show page' do
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

    visit "/books/#{@book_1.id}"
  end

  it 'shows the books title and genre' do
    expect(page).to have_content("Book On Livin'")
    expect(page).to have_content("Self Help")

    expect(page).not_to have_content("Book On Dyin'")
    expect(page).not_to have_content("Horror")
  end

  it 'shows the books authors names' do
    within('#authors') do
      expect(page).to have_content("Smart Happy Guy")
      expect(page).to have_content("Great Silly Guy")

      expect(page).not_to have_content("Not A Good Guy")
    end
  end

  it 'shows the name of the library the book belongs to' do
    within('#library') do
      expect(page).to have_content("Found at: Library One")
      expect(page).not_to have_content("Found at: Free Book Place")
    end
  end

  it 'shows the books authors average ages' do
    expect(page).to have_content("Average Author Age: 27")

    expect(page).not_to have_content("Average Author Age: 20")
    expect(page).not_to have_content("Average Author Age: 135")
  end
end
