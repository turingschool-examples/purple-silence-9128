require "rails_helper"

RSpec.describe "books show page" do
  before :each do
    @library = Library.create!(name: "Denver Public Library")
    @author_1 = Author.create!(name: "Jon Krakauer", birth_year: 1975)

    @author_2 = Author.create!(name: "Barbara Oakley, Ph.D.", birth_year: 1982)
    @author_3 = Author.create!(name: "Jon Mulaney", birth_year: 1989)
    @book_1 = @library.books.create!(title: "Into the Wild", genre: "Non-Fiction")
    @book_2 = @library.books.create!(title: "a Mind for Numbers", genre: "Non-Fiction")
    @ab_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @ab_2 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_1.id)

    visit "/books/#{@book_1.id}"
  end

  it "lists the book with name and genre" do
    expect(page).to have_content("Title: Into the Wild")
    expect(page).to have_content("Genre: Non-Fiction")

    within(".book_authors") do
      expect(page).to have_content("Jon Krakauer")
      expect(page).to have_content("Barbara Oakley, Ph.D.")
    end

    within(".library") do
      expect(page).to have_content("Denver Public Library")
    end
  end

  it "lists the avg_auth_age" do
    @book_3 = @library.books.create!(title: "Into Thin Air", genre: "Non-Fiction")
    @book_4 = @library.books.create!(title: "Free Yolo", genre: "Non-Fiction")

    @ab_3 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_3.id)
    @ab_4 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_4.id)

    visit "/books/#{@book_3.id}"

    expect(page).to have_content("Average Age of Authors: 47.0")
  end
end
