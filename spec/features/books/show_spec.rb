require 'rails_helper'

RSpec.describe "Book Show Page" do
  before :all do
    @library = Library.create!(name: "Big Ass Library")

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

    visit "/books/#{@book_1.id}"
  end

  it "lists the book name, genre, authors and library" do
    # save_and_open_page
    within(".title_genre") do
      expect(page).to have_content("Put This Book Down and Do Your IC")
      expect(page).to have_content("Genre: Nonfiction")

      expect(page).to_not have_content("For God's Sake Don't Read This")
      expect(page).to_not have_content("Genre: Fiction")
    end

    within(".book_authors") do
      expect(page).to have_content("H.T. Thiccums")
      expect(page).to have_content("J.R. Hiccups")

      expect(page).to_not have_content("I.Am. Terrible")
      expect(page).to_not have_content("Wiggles McDoofus")
    end

    within("#library") do
      expect(page).to have_content("Big Ass Library")
    end
  end

  it "lists average age of authors" do
    expect(page).to have_content("Average Age of Authors: 146.5")
  end
end
