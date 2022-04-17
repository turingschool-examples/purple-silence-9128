require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:authors).through(:books) }
  end

  describe 'instance methods' do
    describe '.most_popular_authors' do
      it 'can return the 3 most popular authors determined by book count' do
        library_1 = Library.create!(name: "Round Hill Public Library")

        author_1 = Author.create!(name: "Kurt Vonnegut", birth_year: 1922)
        author_1.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction", library_id: library_1.id)
        author_1.books.create!(title: "Cat's Cradle", genre: "Science Fiction", library_id: library_1.id)

        author_2 = Author.create!(name: "Donna Tartt", birth_year: 1963)
        author_2.books.create!(title: "The Goldfinch", genre: "Fiction", library_id: library_1.id)
        author_2.books.create!(title: "The Little Friend", genre: "Fiction", library_id: library_1.id)
        author_2.books.create!(title: "The Secret History", genre: "Fiction", library_id: library_1.id)

        author_3 = Author.create!(name: "JRR Tolkien", birth_year: 1963)
        author_3.books.create!(title: "The Lord of the Rings", genre: "Fantasy", library_id: library_1.id)

        author_4 = Author.create!(name: "TC Boyle", birth_year: 1963)
        author_4.books.create!(title: "The Harder They Come", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "Outside Looking In", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "When The Killing's Done", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "World's End", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "The Tortilla Curtain", genre: "Fiction", library_id: library_1.id)

        author_5 = Author.create!(name: "John Steinbeck", birth_year: 1963)
        author_5.books.create!(title: "The Grapes of Wrath", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "East of Eden", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "Of Mice and Men", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "In Dubious Battles", genre: "Fiction", library_id: library_1.id)

        author_6 = Author.create!(name: "CS Lewis", birth_year: 1963)
        author_6.books.create!(title: "The Screwtape Letters", genre: "Fiction", library_id: library_1.id)

        library_2 = Library.create!(name: "Purcelville Public Library")
        author_7 = Author.create(name: "George RR Martin", birth_year: 1948)
        author_7.books.create!(title: "A Game of Thrones", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Clash of Kings", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Storm of Swords", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Feast for Crows", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Dance with Dragons", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "The World of Ice and Fire", genre: "Fantasy", library_id: library_2.id)

        expect(library_1.most_popular_authors).to eq([author_4, author_5, author_2])
      end
    end
  end
end
