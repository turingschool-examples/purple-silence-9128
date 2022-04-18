require 'rails_helper'

RSpec.describe 'Books Show' do
  it 'displays the books title, genre, authors names, and library name' do
    lib_1 = Library.create!(name: 'Library of Book Learnin')
    lib_2 = Library.create!(name: 'The Little Library')
    author_1 = Author.create!(name: 'Bob Simmons', birth_year: 1934)
    author_2 = Author.create!(name: 'Jennifer Marley', birth_year: 1961)
    author_3 = Author.create!(name: 'Jason Scripp', birth_year: 1990)
    book_1 = lib_1.books.create!(title: "How to Get Rich Quick", genre: "Self Help")
    BookAuthor.create!(book_id: "#{book_1.id}", author_id: "#{author_1.id}")
    BookAuthor.create!(book_id: "#{book_1.id}", author_id: "#{author_2.id}")

    visit "books/#{book_1.id}"
    
    expect(page).to have_content("How to Get Rich Quick")
    expect(page).to have_content("Bob Simmons")
    expect(page).to have_content("Jennifer Marley")
    expect(page).to have_no_content("Jason Scripp")
    expect(page).to have_content("Library of Book Learnin")
    expect(page).to have_no_content("The Little Library")
  end
end
