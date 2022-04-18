require 'rails_helper'

RSpec.describe "Book Show Page" do
  before :all do
    @library = Library.create!(name: "Big Ass Library")

    @book_1 = @library.books.create!(title: "Put This Book Down and Do Your IC", genre: "Nonfiction")

    @thiccums = Author.create!(name: "H.T. Thiccums", birth_year: 1904)
    @hiccups = Author.create!(name: "J.R. Hiccups", birth_year: 2017)

    @ab_1 = AuthorBook.create!(author_id: @thiccums.id, book_id: @book_1.id)
    @ab_2 = AuthorBook.create!(author_id: @hiccups.id, book_id: @book_1.id)

    visit "/books/#{@book_1.id}"
  end

  it "lists the book name and genre" do
    expect(page).to have_content("Title: Put This Book Down and Do Your IC")
    expect(page).to have_content("Genre: Nonfiction")

    within("#book_authors") do
      expect(page).to have_content("H.T. Thiccums")
      expect(page).to have_content("J.R. Hiccups")
    end

    within("#library") do
      expect(page).to have_content("Big Ass Library")
    end
  end
end
