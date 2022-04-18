# Story 1 of 3
# As a visitor, when I visit a book's show page
# I see the book's name and genre
# And I see a list of authors for that book.
# And I see the name of the Library it belongs to
require 'rails_helper'

RSpec.describe 'books show page' do
  before do
    @lib1 = Library.create!(name: 'John')
    @lib2 = Library.create!(name: 'Paul')

    @book1 = @lib1.books.create!(title: 'The Hobbit', genre: 'Fantasy')
    @book2 = @lib2.books.create!(title: 'The Hitchhickers Guide', genre: 'Sci-fi')

    @author1 = Author.create!(name: 'J.R.R. Tolkin', birth_year: 1910)
    @author2 = Author.create!(name: 'Douglas Adams', birth_year: 1950)
    @author3 = Author.create!(name: 'Some guy', birth_year: 2000)

    @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
    @author_book2 = AuthorBook.create!(author: @author2, book: @book1)

    visit library_book_path(@lib1,@book1)
  end

	it 'shows book attributes' do
    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book1.genre)
  end
  it 'shows a list of authors for the book' do
    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@author2.name)
    expect(page).to_not have_content(@author3.name)
  end

  it 'shows the Library the book belongs to' do
    expect(page).to have_content(@lib1.name)
  end
end
