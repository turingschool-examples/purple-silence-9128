require 'rails_helper'

RSpec.describe 'library show page' do
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

    visit library_path(@lib1)

  end

	it 'shows library name and has a link to library author index page' do

    expect(page).to have_content(@lib1.name)
    click_on("All authors")
#    expect(path).to eq()
### Out of time

  end
end
