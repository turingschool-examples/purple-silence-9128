require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :book_authors}
    it { should have_many(:authors).through(:book_authors)}
  end

  describe 'instance methods' do
    it "calculates the average age of the book's authors" do
      library = Library.create!(name: 'Denver Public Library')
      book = library.books.create!(title: 'Elements of Style', genre: 'Style Guides')
      author = book.authors.create!(name: 'William Strunk', birth_year: 1945)
      author_1 = book.authors.create!(name: 'E.B. White', birth_year: 1950)

      expect(book.average_age_of_author).to eq(74.5)
    end
  end
end
