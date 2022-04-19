require 'rails_helper'

RSpec.describe 'library show page' do

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
  end

  # Extension
  # As a visitor
  # When I visit a library's show page
  # I can see the three most popular authors that are available in the library
  # (Popularity is based on how many books the author has in the library)
  # it 'displays the three most popular authors for the library' do
  #   library = Library.create!(name: 'Denver Public Library')
  #   book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
  #   strunk = book.authors.create!(name: 'William Strunk', birth_year: 1945)
  #   white = book.authors.create!(name: 'E.B. White', birth_year: 1950)
  #
  #   book_1 = library.books.create!(title: "Grims' Fairy Tales", genre: 'Fair Tales')
  #   jacob = book_1.authors.create!(name: 'Jacob', birth_year: 1800)
  #   wilhelm = book_1.authors.create!(name: 'Wilhelm', birth_year: 1805)
  #
  #   book_2 = library.books.create!(title: 'Wilhelms Fairy Tales', genre: 'Fair Tales')
  #   wilhelm = book_2.authors.create!(name: 'Wilhelm', birth_year: 1805)
  #
  #   book_2 = library.books.create!(title: 'Sytles of Writing', genre: 'Style Guides')
  #   strunk = book_2.authors.create!(name: 'William Strunk', birth_year: 1945)
  #
  #   book_3 = library.books.create!(title: 'Writing 101', genre: 'Style Guides')
  #   seuss = book_3.authors.create!(name: 'Seuss', birth_year: 1945)
  #
  #   book_4 = library.books.create!(title: 'Reading 101', genre: 'Style Guides')
  #   seuss = book_4.authors.create!(name: 'Seuss', birth_year: 1945)
  #
  #   visit "/libraries/#{library.id}"
  #
  #   expect(page).to have_content('William Strunk')
  #   expect(page).to have_content('Wilhelm')
  #   expect(page).to have_content('Seuss')
  #   expect(page).to_not have_content('Jacob')
  #   expect(page).to_not have_content('White')
  # end
end
