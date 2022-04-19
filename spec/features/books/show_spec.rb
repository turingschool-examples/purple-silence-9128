require 'rails_helper'

RSpec.describe 'Book Show Page', type: :feature do

  before :each do
    @library_1 = Library.create!(name: "Wake Forest Public Library")
    @book_1 = Book.create!(title: "Dragons of Autumn Twilight", genre: "Fantasy", library_id: @library_1.id)
    @author_1 = Author.create!(name: "Margaret Weis", birth_year: 1948)
    @author_2 = Author.create!(name: "Tracy Hickman", birth_year: 1955)
    @author_book_1 = AuthorsBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @author_book_2 = AuthorsBook.create!(author_id: @author_2.id, book_id: @book_1.id)
  end

  it 'Shows an individual book and all related attributes' do
    visit book_path(@book_1.id)

    within("#book-#{@book_1.id}") do
      expect(page).to have_content("Title: #{@book_1.title}")
      expect(page).to have_content("Genre: #{@book_1.genre}")
      expect(page).to have_content("Library: #{@library_1.name}")
      expect(page).to have_content(@author_1.name)
      expect(page).to have_content(@author_2.name)
    end
  end

  it 'Displays average age of all authors who worked on a book' do 
    visit book_path(@book_1.id)

    within("#book-#{@book_1.id}") do
      expect(page).to have_content("Average age of authors: 70")
    end
  end
end