require "rails_helper"

RSpec.describe "library show page" do
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

    visit "/libraries/#{@central.id}"
  end
  describe "when I visit a library show page" do
    it "displays the name of the library" do
      expect(page).to have_content("Central Public Library")

    end

    it "has a link to take me to the library's author index page" do
      click_on "List of Authors"

      expect(current_path).to eq("/libraries/#{@central.id}/authors")

    end
  end
end
