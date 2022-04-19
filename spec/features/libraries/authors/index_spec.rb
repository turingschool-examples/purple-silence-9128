require "rails_helper"

RSpec.describe "libraries authors index page" do
  before (:each) do
    @central = Library.create!(name: "Central Public Library")

    @hobbit = @central.books.create!(title: "The Hobbit", genre: "Fantasy")
    @fellowship = @central.books.create!(title: "The Fellowship of the Ring", genre: "Fantasy")
    @wrinkle = @central.books.create!(title: "A Wrinkle in Time", genre: "Fantasy")

    @tolkien = Author.create!(name: "Tolkien", birth_year: 1886)
    @fake = Author.create!(name: "Faker", birth_year: 1906)
    @engle = Author.create!(name: "L'Engle", birth_year: 1946)

    @ab1 = AuthorBook.create!(book_id: @hobbit.id, author_id: @tolkien.id)
    @ab2 = AuthorBook.create!(book_id: @wrinkle.id, author_id: @engle.id)
    @ab3 = AuthorBook.create!(book_id: @hobbit.id, author_id: @fake.id)
    @ab4 = AuthorBook.create!(book_id: @fellowship.id, author_id: @tolkien.id)

    visit "/libraries/#{@central.id}/authors"
  end

  describe "when I visit the index page" do
    it  "displays all the unique authors at this library" do
      expect(page).to have_content("Tolkien", count: 1)
      expect(page).to have_content("Faker")
      expect(page).to have_content("L'Engle")
    end
  end
end
