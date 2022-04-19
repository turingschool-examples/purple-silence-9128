require 'rails_helper'

RSpec.describe 'book show page' do
  it 'displays the book details' do
    library = Library.create!(name: 'Denver Public Library')
    book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
    author = book.authors.create!(name: 'William Strunk', birth_year: 1945)
    author_1 = book.authors.create!(name: 'E.B. White', birth_year: 1950)

    visit "/books/#{book.id}"

    expect(page).to have_content('Elements of Style')
    expect(page).to have_content('Style Guides')
    expect(page).to have_content('William Strunk')
    expect(page).to have_content('E.B. White')
    expect(page).to have_content('Denver Public Library')
  end

  # Story 2 of 3
  # As a visitor
  # when I visit a book's show page
  # I see the average age of the authors for that book
  # ```

  it 'displays the average age of the authors' do
    library = Library.create!(name: 'Denver Public Library')
    book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
    author = book.authors.create!(name: 'William Strunk', birth_year: 1945)
    author_1 = book.authors.create!(name: 'E.B. White', birth_year: 1950)

    visit "/books/#{book.id}"

    expect(page).to have_content('Average age of authors: 74.5')
  end

end
