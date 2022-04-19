require 'rails_helper'

RSpec.describe 'Book Show Page', type: :feature do

  before :each do
    @library_1 = Library.create!(name: "Wake Forest Public Library")
    @book_1 = Book.create!(title: "Eragon", genre: "Fantasy", library_id: @library_1.id)
    @author_1 = Author.create!(name: "Christopher Paolini", birth_year: 1983)
    @author_book_1 = AuthorsBook.create!(author_id: @author_1.id, book_id: @book_1.id)
  end

  it 'Shows an individual book and all related attributes' do
    visit book_path(@book_1.id)

    within("book-#{@book_1.id}") do
      expect(page).to have_content("Title: #{@book_1.title}")
      expect(page).to have_content("Genre: #{@book_1.genre}")
      expect(page).to have_content("Library: #{@library_1.name}")
      expect(page).to have_content("Authors: #{@author_1.name}")
    end
  end
end