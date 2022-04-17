require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end

  describe 'instance methods' do
    describe '.average_age_of_authors' do
      it 'can determine the average age of authors for the book, assuming the authors are still alive' do
        library = Library.create!(name: "Round Hill Public Library")
        book_1 = library.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction")
        book_2 = library.books.create!(title: "The Secret History", genre: "Mystery")
        author_1 = book_1.authors.create!(name: "Kurt Vonnegut", birth_year: 1922)
        author_2 = book_1.authors.create!(name: "Kilgore Trout", birth_year: 1908)
        author_3 = book_2.authors.create!(name: "Donna Tartt", birth_year: 1963)

        expect(book_1.average_age_of_authors).to eq(107.0)
      end
    end
  end
end
