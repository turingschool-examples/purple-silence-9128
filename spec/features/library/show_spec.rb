require "rails_helper"

RSpec.describe "Library Show Page", type: :feature do
  it "shows the library name" do
    library = Library.create!(name: "Lakewood Public Library")

    book1 = library.books.create!(title: "Ruby for Dummy's", genre: "Self-Help")

    author1 = Author.create!(name: "Mike Dao", birth_year: 1985)
    author2 = Author.create!(name: "Dani Coleman", birth_year: 1995)

    book_author1 = BookAuthor.create!(book_id: book1.id, author_id: author1.id)
    book_author2 = BookAuthor.create!(book_id: book1.id, author_id: author2.id)

    visit library_path(library[:id])

    within "#library" do
      expect(page).to have_content(library.name)

      library.authors.each do |author|
        expect(page).to have_content(author.name)
      end
    end
  end
end
