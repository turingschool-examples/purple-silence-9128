require 'rails_helper'

RSpec.describe 'a library authors index page' do
  before :each do
    @library_1 = Library.create!(name: 'Denver Public Library')
    @library_2 = Library.create!(name: 'Aurora Public Library')

    @book_1 = @library_1.books.create!(title: 'Epic Quest', genre: 'Adventure')
    @book_1a = @library_1.books.create!(title: 'Epic Quest 2', genre: 'Adventure')
    @book_1b = @library_1.books.create!(title: 'Epic Quest 3', genre: 'Adventure')
    @book_2 = @library_2.books.create!(title: 'The Haunted Mansion', genre: 'Horror')

    @author_1 = Author.create!(name: 'Gilgamesh', age: 555)
    @author_1a = Author.create!(name: 'Guthix', age: 657)
    @author_1b = Author.create!(name: 'Zamorak', age: 657)
    @author_2 = Author.create!(name: 'Saradomin', age: 950)

    @book_1.author_books.create!(author_id: @author_1.id)
    @book_1.author_books.create!(author_id: @author_1a.id)
    @book_1a.author_books.create!(author_id: @author_1.id)
    @book_1a.author_books.create!(author_id: @author_1a.id)
    @book_1b.author_books.create!(author_id: @author_1b.id)
    @book_2.author_books.create!(author_id: @author_2.id)

    visit "/libraries/#{@library_1.id}/authors"
  end

  context 'user story 3' do
    it 'shows a unique list of all authors found in the library' do
      expect(page).to have_content('Gilgamesh', count: 1)
      expect(page).to have_content('Guthix', count: 1)
      expect(page).to have_content('Zamorak', count: 1)
      expect(page).to_not have_content('Saradomin')
    end
  end
end
