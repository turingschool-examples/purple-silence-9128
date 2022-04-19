require 'rails_helper'

RSpec.describe 'the Book show page' do
  before :each do
    @library = Library.create!(name: "DPLibrary")
    @book = @library.books.create!(title: "There and Back Again", genre: 'Fantasy')
    @author = @book.authors.create!(name: "JRR Tolkein", birth_year: 1892)
    @book.author_books.create!(book_id: @book.id, author_id: @author.id)
  end

  it 'displays the books name and genre' do
    visit "/libraries/#{@library.id}/books/#{@book.id}"
    save_and_open_page

    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.genre)
    expect(page).to have_content(@library.name)
  end

  it 'displays a list of authors for that book'

  it 'displays the library the book belongs to'
end
