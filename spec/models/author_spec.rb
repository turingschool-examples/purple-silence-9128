require "rails_helper"

RSpec.describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
    it { should validate_numericality_of(:birth_year) }
  end

  describe "relationships" do
    it { should have_many(:book_authors) }
    it { should have_many(:books).through(:book_authors) }
    it { should have_many(:libraries).through(:books) }
  end

  describe "Author Age" do
    it "should return age of an Author" do
      author1 = Author.create!(name: "Mike Dao", birth_year: 1985)
      expect(author1.author_age).to eq(37)
    end
  end
end
