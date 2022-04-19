require 'rails_helper'

RSpec.describe 'book show page' do

  # Story 1 of 3
  # As a visitor, when I visit a book's show page
  # I see the book's name and genre
  # And I see a list of authors for that book.
  # And I see the name of the Library it belongs to
  it 'displays the book details' do
    library = Library.create!(name: 'Denver Public Library')
    book = library.books.create!(title: 'Foundation', genre: 'Sci-fi')
    author = book.authors.create!(name: 'Isaac Asimov', birth_year: 1920)
    visit "/books/#{book.id}"
    expect(page).to have_content('Foundation')
    expect(page).to have_content('Sci-fi')
    expect(page).to have_content('Isaac Asimov')
    expect(page).to have_content('Denver Public Library')
  end

end
