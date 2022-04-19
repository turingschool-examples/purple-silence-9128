require 'rails_helper'

RSpec.describe 'the Library show page' do
  before :each do
    @library = Library.create!(name: "DPLibrary")
    @book = @library.books.create!(title: "There and Back Again", genre: 'Fantasy')
    @author = @book.authors.create!(name: "JRR Tolkein", birth_year: 1892)
    @author_2 = @book.authors.create!(name: "Brando Sando", birth_year: 1967)
  end

  it 'displays the name of the library' do
    visit "/libraries/#{@library.id}"

    expect(page).to have_content("DPLibrary")
  end

  it 'has a link to all authors that have written books in the library'
  it 'takes me to the library index page'
  it 'displays a unique list of names of all authors the library has'
end
