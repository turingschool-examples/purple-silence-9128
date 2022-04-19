require "rails_helper"

RSpec.describe "books show page" do
  before (:each) do
    @central = Library.create!(name: "Central Public Library")

    @hobbit = @central.books.create!(title: "The Hobbit", genre: "Fantasy")
    @wrinkle = @central.books.create!(title: "A Wrinkle in Time", genre: "Fantasy")

    @tolkien = Author.create!(name: "Tolkien", birth_year: 1886)
    @fake = Author.create!(name: "Faker", birth_year: 1906)
    @engle = Author.create!(name: "L'Engle", birth_year: 1946)

    @ab1 = AuthorBook.create!(book_id: @hobbit.id, author_id: @tolkien.id)
    @ab2 = AuthorBook.create!(book_id: @wrinkle.id, author_id: @engle.id)
    @ab3 = AuthorBook.create!(book_id: @hobbit.id, author_id: @fake.id)

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

    it "displays the average age of the authors" do
      visit "/books/#{@hobbit.id}"

      expect(page).to have_content("126")
    end
  end
end
