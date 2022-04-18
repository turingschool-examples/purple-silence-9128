require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe "relationships" do
    it { should belong_to(:library) }
    it { should have_many(:author_books) }
    it { should have_many(:authors).through(:author_books) }
  end

  # let!(:dpl) { Library.create!(name: "Denver Public Library") }
  # let!(:herbology) { Book.create!(title: "A Guide to Herbology", genre: "Nonfiction", library_id: dpl.id) }
  # let!(:henderson) { Author.create!(name: "Dee Henderson", birth_year: 1959) }
  # let!(:goshawk) { Author.create!(name: "Gerald Goshawk", birth_year: 1948) }
  # let!(:author_book_herbology) { AuthorBook.create!(book_id: herbology.id, author_id: henderson.id) }
  # let!(:author_book_herbology) { AuthorBook.create!(book_id: herbology.id, author_id: goshawk.id) }
  #
  # it "returns all authors names for a book" do
  #   expect(herbology.author_names).to eq(["Dee Henderson", "Gerald Goshawk"])
  # end
end
