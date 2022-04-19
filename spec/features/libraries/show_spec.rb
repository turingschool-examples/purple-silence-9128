require 'rails_helper'

RSpec.describe 'library show page' do

  # ```
  # Story 3 of 3
  # As a visitor
  # When I visit a Library's show page
  # I see the name of that library

  # and i see a link to view all of the authors that have written books that the library has
  # When I click on that link
  # I am taken to a Library's authors index page
  # and I can see a unique list of names of all the authors that this library has
  # ```

  it 'displays the name of the library and a link to the author index page' do
    library = Library.create!(name: 'Denver Public Library')
    book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
    author_0 = book.authors.create!(name: 'William Strunk', birth_year: 1945)
    author_1 = book.authors.create!(name: 'E.B. White', birth_year: 1950)

    book_1 = library.books.create!(title: "Grims' Fairy Tales", genre: 'Fair Tales')
    author_2 = book_1.authors.create!(name: 'Jacob Grimm', birth_year: 1800)
    author_3 = book_1.authors.create!(name: 'Wilhelm Grimm', birth_year: 1805)

    book_2 = library.books.create!(title: 'Sytles of Writing', genre: 'Style Guides')
    author_4 = book_2.authors.create!(name: 'William Strunk', birth_year: 1945)

    visit "/libraries/#{library.id}"

    expect(page).to have_content('Denver Public Library')

    click_link "Authors Index"
    expect(current_path).to eq("/libraries/#{library.id}/authors")
    expect(page).to have_content('William Strunk')
    expect(page).to have_content('E.B. White')
    expect(page).to have_content('Jacob Grimm')
    expect(page).to have_content('Wilhelm Grimm')
    save_and_open_page
    expect('William Strunk').to appear_before('E.B. White')
  end
end
