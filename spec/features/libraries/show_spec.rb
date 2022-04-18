require 'rails_helper'

RSpec.describe "Library Show Page" do
  before :all do
    @library = Library.create!(name: "Big Ass Library")
    @small_library = Library.create!(name: "Small Ass Library")

    @book_1 = @library.books.create!(title: "Put This Book Down and Do Your IC", genre: "Nonfiction")
    @book_2 = @library.books.create!(title: "For God's Sake Don't Read This", genre: "Fiction")

    @thiccums = Author.create!(name: "H.T. Thiccums", birth_year: 1904)
    @hiccups = Author.create!(name: "J.R. Hiccups", birth_year: 2017)
    @bad_author = Author.create!(name: "I.Am. Terrible", birth_year: 1847)
    @strange_author = Author.create!(name: "Wiggles McDoofus", birth_year: 1975)

    @ab_1 = AuthorBook.create!(author_id: @thiccums.id, book_id: @book_1.id)
    @ab_2 = AuthorBook.create!(author_id: @hiccups.id, book_id: @book_1.id)
    @ab_3 = AuthorBook.create!(author_id: @bad_author.id, book_id: @book_2.id)
    @ab_4 = AuthorBook.create!(author_id: @strange_author.id, book_id: @book_2.id)
  end

  it "shows name of library" do
    visit "/libraries/#{@library.id}"

    expect(page).to have_content("Big Ass Library")
    expect(page).to_not have_content("Small Ass Library")
  end

  it "has link to view all authors that have books in the library" do
    visit "/libraries/#{@library.id}"

    click_link "Authors At This Library"

    expect(current_path).to eq("/libraries/#{@library.id}/authors")
    expect(page).to have_content("H.T. Thiccums")
    expect(page).to have_content("J.R. Hiccups")
    expect(page).to have_content("I.Am. Terrible")
    expect(page).to have_content("Wiggles McDoofus")
  end

  it "lists three most popular authors" do
    book_3 = @library.books.create!(title: "This Book is Sooo Good", genre: "Nonfiction")
    book_4 = @library.books.create!(title: "Hello your FUTURE'S ON THE LINE", genre: "Fiction")

    ab_5 = AuthorBook.create!(author_id: @thiccums.id, book_id: book_3.id)
    ab_6 = AuthorBook.create!(author_id: @hiccups.id, book_id: book_4.id)
    ab_7 = AuthorBook.create!(author_id: @bad_author.id, book_id: book_4.id)

    visit "/libraries/#{@library.id}"
    # save_and_open_page
    within("#popular_authors") do
      expect(page).to have_content(@thiccums.name)
      expect(page).to have_content(@hiccups.name)
      expect(page).to have_content(@bad_author.name)
      expect(page).to_not have_content(@strange_author.name)
    end
  end
end
