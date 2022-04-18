require 'rails_helper'

RSpec.describe 'Libraries Show' do
  it 'displays the Librarys name' do
    lib_1 = Library.create!(name: 'Library of Book Learnin')

    visit "/libraries/#{lib_1.id}"

    expect(page).to have_content("Library of Book Learnin")
  end

  it 'displays a link to that librarys authors index ' do
    lib_1 = Library.create!(name: 'Library of Book Learnin')
    author_1 = Author.create!(name: 'Bob Simmons', birth_year: 1934)
    author_2 = Author.create!(name: 'Jennifer Marley', birth_year: 1961)
    author_3 = Author.create!(name: 'Jason Scripp', birth_year: 1990)
    book_1 = lib_1.books.create!(title: "How to Get Rich Quick", genre: "Self Help")
    BookAuthor.create!(book_id: "#{book_1.id}", author_id: "#{author_1.id}")
    BookAuthor.create!(book_id: "#{book_1.id}", author_id: "#{author_2.id}")

    visit "/libraries/#{lib_1.id}"

    click_link "Authors Index"

    expect(current_path).to eq("/libraries/#{lib_1.id}/authors")
    expect(page).to have_content('Bob Simmons')
    expect(page).to have_content('Jennifer Marley')
    expect(page).to have_no_content("Jason Scripp")
  end
end
