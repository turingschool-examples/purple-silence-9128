require 'rails_helper'

RSpec.describe 'a library show page' do
  before :each do
    @library_1 = Library.create!(name: 'Denver Public Library')
    @library_2 = Library.create!(name: 'Aurora Public Library')

    visit "/libraries/#{@library_1.id}"
  end

  context 'user story 3' do
    it 'has the name of the library' do
      expect(page).to have_content('Denver Public Library')
      expect(page).to_not have_content('Aurora Public Library')
    end

    it 'has a link to the library authors index' do
      click_link "View all authors at Denver Public Library"

      expect(current_path).to eq("/libraries/#{@library_1.id}/authors")
    end
  end

  context 'extension' do
    it 'lists the 3 most popular authors based on # of books in the library' do
      book_1 = @library_1.books.create!(title: 'Epic Quest', genre: 'Adventure')
      book_2 = @library_1.books.create!(title: 'Epic Quest 2', genre: 'Adventure')
      book_3 = @library_1.books.create!(title: 'The Haunted Mansion', genre: 'Horror')
      book_4 = @library_1.books.create!(title: 'The Haunted Mansion 2', genre: 'Horror')

      author_1 = Author.create!(name: 'Gilgamesh', age: 555)
      book_1.author_books.create!(author_id: author_1.id)
      book_2.author_books.create!(author_id: author_1.id)

      author_2 = Author.create!(name: 'Guthix', age: 657)
      book_1.author_books.create!(author_id: author_2.id)
      book_2.author_books.create!(author_id: author_2.id)
      book_3.author_books.create!(author_id: author_2.id)

      author_3 = Author.create!(name: 'Saradomin', age: 950)
      book_1.author_books.create!(author_id: author_3.id)
      book_2.author_books.create!(author_id: author_3.id)
      book_3.author_books.create!(author_id: author_3.id)
      book_4.author_books.create!(author_id: author_3.id)

      author_4 = Author.create!(name: 'Zamorak', age: 950)
      book_4.author_books.create!(author_id: author_4.id)

      visit "/libraries/#{@library_1.id}"

      expect(page).to_not have_content('Zamorak')
      expect(page).to have_content('Saradomin')
      expect(page).to have_content('Guthix')
      expect(page).to have_content('Gilgamesh')
    end
  end
end
