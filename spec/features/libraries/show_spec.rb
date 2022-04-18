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

  it 'lists the three most popular authors in the library' do
    lib_1 = Library.create!(name: 'Library of Book Learnin')
    author_1 = Author.create!(name: 'Bob Simmons', birth_year: 1934)
    author_2 = Author.create!(name: 'Jennifer Marley', birth_year: 1961)
    author_3 = Author.create!(name: 'Jason Scripp', birth_year: 1990)
    author_4 = Author.create!(name: 'Precious Peanutson', birth_year: 1978)

    book_1 = lib_1.books.create!(title: "How to Get Rich Quick", genre: "Self Help")
    book_2 = lib_1.books.create!(title: "How be Happy", genre: "Self Help")
    book_3 = lib_1.books.create!(title: "Gain Weight Fast", genre: "Self Help")
    book_4 = lib_1.books.create!(title: "How to Computer", genre: "Self Help")
    book_5 = lib_1.books.create!(title: "Steal Things and Get Away With It", genre: "Self Help")
    book_6 = lib_1.books.create!(title: "How to Protect Yourself From Robbers", genre: "Self Help")
    book_7 = lib_1.books.create!(title: "100 Ways to Use an Adult Diaper", genre: "Self Help")
    book_8 = lib_1.books.create!(title: "Scoring Free Pizza", genre: "Self Help")
    book_9 = lib_1.books.create!(title: "How to Fix a Squeaky Mattress", genre: "Self Help")
    book_10 = lib_1.books.create!(title: "Be the Best You", genre: "Self Help")
    BookAuthor.create!(book_id: "#{book_1.id}", author_id: "#{author_1.id}")

    BookAuthor.create!(book_id: "#{book_2.id}", author_id: "#{author_2.id}")
    BookAuthor.create!(book_id: "#{book_3.id}", author_id: "#{author_2.id}")

    BookAuthor.create!(book_id: "#{book_4.id}", author_id: "#{author_3.id}")
    BookAuthor.create!(book_id: "#{book_5.id}", author_id: "#{author_3.id}")
    BookAuthor.create!(book_id: "#{book_6.id}", author_id: "#{author_3.id}")

    BookAuthor.create!(book_id: "#{book_7.id}", author_id: "#{author_4.id}")
    BookAuthor.create!(book_id: "#{book_8.id}", author_id: "#{author_4.id}")
    BookAuthor.create!(book_id: "#{book_9.id}", author_id: "#{author_4.id}")
    BookAuthor.create!(book_id: "#{book_10.id}", author_id: "#{author_4.id}")

    visit "/libraries/#{lib_1.id}"
    expect(page).to have_content('Precious Peanutson')
    expect(page).to have_content('Jason Scripp')
    expect(page).to have_content('Jennifer Marley')
    expect(page).to have_no_content('Bob Simmons')
  end
end
