require "rails_helper"

RSpec.describe "Book Show Page", type: :feature do
  it "shows the book's attributes" do
    library = Library.create!(name: "Lakewood Public Library")

    book1 = library.books.create!(title: "Ruby for Dummy's", genre: "Self-Help")

    author1 = Author.create!(name: "Mike Dao", birth_year: 1985)
    author2 = Author.create!(name: "Dani Coleman", birth_year: 1995)

    book_author1 = BookAuthor.create!(book_id: book1.id, author_id: author1.id)
    book_author2 = BookAuthor.create!(book_id: book1.id, author_id: author2.id)

    visit book_path(book1[:id])

    within "#book" do
      expect(page).to have_content(book1.title)
      expect(page).to have_content(book1.genre)

      book1.authors.each do |author|
        expect(page).to have_content(author.name)
      end

      expect(page).to have_content(book1.library.name)
    end

    it "shows the book's authors average age" do
      library = Library.create!(name: "Lakewood Public Library")

      book1 = library.books.create!(title: "Ruby for Dummy's", genre: "Self-Help")

      author1 = Author.create!(name: "Mike Dao", birth_year: 1985)
      author2 = Author.create!(name: "Dani Coleman", birth_year: 1995)

      book_author1 = BookAuthor.create!(book_id: book1.id, author_id: author1.id)
      book_author2 = BookAuthor.create!(book_id: book1.id, author_id: author2.id)

      visit book_path(book1[:id])

      within "#book" do
        expect(page).to have_content(author.avg_age_of_authors)
      end
    end
  end
end
