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

    @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
    @author_book2 = AuthorBook.create!(author: @author2, book: @book1)

  end

	it 'shows book attributes' do
    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book1.genre)
  end
end
