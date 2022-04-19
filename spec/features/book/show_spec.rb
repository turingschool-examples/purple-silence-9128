require "rails_helper"

RSpec.describe "Book Show Page", type: :feature do
  it "shows the book's attributes" do
    book1 = Book.create!(title: "Ruby for Dummy's", genre: "Self-Help")
    author1 = book1.author.create!(name: "Mike Dao", birth_year: 1985)
  end
end
