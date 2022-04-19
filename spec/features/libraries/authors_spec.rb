require 'rails_helper'

RSpec.describe 'Library Authors Index', type: :feature do
  
  before :each do
    @library_1 = Library.create!(name: "Wake Forest Public Library")
    @book_1 = Book.create!(title: "Dragons of Autumn Twilight", genre: "Fantasy", library_id: @library_1.id)
    @book_2 = Book.create!(title: "Dragons of Winter Night", genre: "Fantasy", library_id: @library_1.id)
    @author_1 = Author.create!(name: "Margaret Weis", birth_year: 1948)
    @author_2 = Author.create!(name: "Tracy Hickman", birth_year: 1955)
    @author_book_1 = AuthorsBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @author_book_2 = AuthorsBook.create!(author_id: @author_2.id, book_id: @book_1.id)
    @author_book_3 = AuthorsBook.create!(author_id: @author_1.id, book_id: @book_2.id)
    @author_book_4 = AuthorsBook.create!(author_id: @author_2.id, book_id: @book_2.id)
  end

  it 'Displays list of authors within a library' do
    visit "/libraries/#{@library_1.id}/authors"

    within("#author-list") do
      expect(page).to have_content(@author_1.name)
      expect(page).to have_content(@author_2.name)
    end
  end
end