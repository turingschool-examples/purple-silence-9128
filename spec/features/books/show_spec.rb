require 'rails_helper'

RSpec.describe 'the Book show page' do
  before :each do
    @library = Library.create!(name: "DPLibrary")
    @book = @library.books.create!(title: "There and Back Again", genre: 'Fantasy')
    @author = @book.authors.create!(name: "JRR Tolkein", birth_year: 1892)
    @author_2 = @book.authors.create!(name: "Brando Sando", birth_year: 1967)
    @book.author_books.create!(book_id: @book.id, author_id: @author.id)
  end

  it 'displays the books name and genre' do
    visit "/books/#{@book.id}"

    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.genre)
  end

  it 'displays a list of authors for that book' do
    visit "/books/#{@book.id}"

    expect(page).to have_content("JRR Tolkein")
    expect(page).to have_content("Brando Sando")
  end

  it 'displays the library the book belongs to' do
    visit "/books/#{@book.id}"
    expect(page).to have_content(@library.name)
  end

  it 'displays the average age of the authors' do
    visit "/books/#{@book.id}"
    expect(page).to have_content("Average Age of Author")
  end
end
