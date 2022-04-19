require "rails_helper"

RSpec.describe "books show page" do
  before (:each) do
    @central = Library.create!(name: "Central Public Library")

    @hobbit = @central.books.create!(name: "The Hobbit", genre: "Fantasy")
    @wrinkle = @central.books.create!(name: "A Wrinkle in Time", genre: "Fantasy")

    @tolkien = Author.create!(name: "Tolkien", birth_year: 1886)
    @engle = Author.create!(name: "L'Engle", birth_year: 1946)

  end
  describe "when I visit a book show page" do
    it "displays the book name and genre" do
      visit "/books/#{@hobbit.id}"

      expect(page).to have_content("The Hobbit")
      expect(page).to have_content("Fantasy")
      expect(page).to_not have_content("A Wrinkle in Time")

    end

    it "displays the author(s) of that book" do
      visit "/books/#{@hobbit.id}"

      expect(page).to have_content("Tolkien")
      expect(page).to_not have_content("L'Engle")
    end

    it "displays the library it belongs to" do
      visit "/books/#{@hobbit.id}"

      expect(page).to have_content("Central Public Library")

    end
  end
end
