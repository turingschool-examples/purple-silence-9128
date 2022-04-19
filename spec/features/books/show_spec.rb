require 'rails_helper'

RSpec.describe 'a books show page' do
  before :each do
    @library_1 = Library.create!(name: 'Denver Public Library')
    @library_2 = Library.create!(name: 'Aurora Public Library')

    @book_1 = @library_1.books.create!(title: 'Epic Quest', genre: 'Adventure')
    @book_2 = @library_2.books.create!(title: 'The Haunted Mansion', genre: 'Horror')

    @author_1 = Author.create!(name: 'Gilgamesh', age: 555)
    @author_1a = Author.create!(name: 'Guthix', age: 657)
    @author_2 = Author.create!(name: 'Saradomin', age: 950)

    @book_1.author_books.create!(author_id: @author_1.id)
    @book_1.author_books.create!(author_id: @author_1a.id)
    @book_2.author_books.create!(author_id: @author_2.id)

    visit "/books/#{@book_1.id}"
  end

  context 'user story 1' do
    it 'shows the name and genre' do
      expect(page).to have_content('Epic Quest')
      expect(page).to have_content('Genre: Adventure')
      expect(page).to_not have_content('The Haunted Mansion')
      expect(page).to_not have_content('Genre: Horror')
    end

    it 'shows names of all associated authors' do
      expect(page).to have_content('Gilgamesh')
      expect(page).to have_content('Guthix')
      expect(page).to_not have_content('Saradomin')
    end

    it 'shows the name of the library it belongs to' do
      expect(page).to have_content('Denver Public Library')
      expect(page).to_not have_content('Aurora Public Library')
    end
  end

  context 'user story 2' do
    it 'shows the average age of authors for the book' do
      expect(page).to have_content("Average age of authors: 606")
    end
  end
end
