require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe "relationships" do
    it { should belong_to :library }
    it { should have_many(:book_authors) }
    it { should have_many(:authors).through(:book_authors) }
  end

  describe "Book Author's Average Age" do
    it "should return average age of all book authors" do
      library = Library.create!(name: "Lakewood Public Library")

      book1 = library.books.create!(title: "Ruby for Dummy's", genre: "Self-Help")

      author1 = Author.create!(name: "Mike Dao", birth_year: 1985)
      author2 = Author.create!(name: "Dani Coleman", birth_year: 1995)

      book_author1 = BookAuthor.create!(book_id: book1.id, author_id: author1.id)
      book_author2 = BookAuthor.create!(book_id: book1.id, author_id: author2.id)

      expect(book1.avg_age_of_authors).to eq(32)
    end
  end
end
