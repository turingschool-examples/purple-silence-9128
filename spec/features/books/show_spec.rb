require "rails_helper"

RSpec.describe "books show page" do
  before :each do
    @library = Library.create!(name: "Denver Public Library")
    @author = Author.create!(name: "Jon Krakauer", birth_year: 1975)
    @author_1 = Author.create!(name: "Barbara Oakley, Ph.D.", birth_year: 1982)
    @book = Book.create!(title: "Into the Wild", genre: "Non-Fiction")
    @book_1 = Book.create!(title: "a Mind for Numbers", genre: "Non-Fiction")
    @ab = AuthorBook.create!(author_id: @author.id, book_id: @book.id)
    @ab_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)

    visit "/books/#{@book.id}"
  end

  it "lists the book with name and genre" do
    expect(page).to have_content("Title: Into the Wild")
    expect(page).to have_content("Genre: Nonfiction")

    within("#book_authors") do
      expect(page).to have_content("Jon Krakauer")
      expect(page).to have_content("Barbara Oakley, Ph.D.")
    end

    within("#library") do
      expect(page).to have_content("Denver Public Library")
    end
  end
end
