require 'rails_helper'

RSpec.describe 'Library Show Page', type: :feature do

  before :each do
    @library_1 = Library.create!(name: "Wake Forest Public Library")
    @book_1 = Book.create!(title: "Dragons of Autumn Twilight", genre: "Fantasy", library_id: @library_1.id)
    @author_1 = Author.create!(name: "Margaret Weis", birth_year: 1948)
    @author_2 = Author.create!(name: "Tracy Hickman", birth_year: 1955)
    @author_book_1 = AuthorsBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @author_book_2 = AuthorsBook.create!(author_id: @author_2.id, book_id: @book_1.id)
  end

  it 'Displays individual library name and link to library author index' do
    visit library_path(@library_1.id)

    expect(page).to have_content(@library_1.name)
    expect(page).to have_link("View Authors", href: "/libraries/#{@library_1.id}/authors")
  end
end