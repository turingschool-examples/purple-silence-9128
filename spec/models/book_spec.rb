require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :book_authors }
    it { should have_many :authors }
  end

  describe 'methods' do
    before do
      @lib_1 = Library.create!(name: "Delware")
      @book_3 = @lib_1.books.create!(
        title: "Mind for Numbers",
        genre: "NonFiction"
      )
      @book_9 = @lib_1.books.create!(
        title: "Learning to Learn",
        genre: "NonFiction"
      )

      @lib_2 = Library.create!(name: "Greenie")
      @book_5 = @lib_2.books.create!(
        title: "Fizban's Treasury of Dragons",
        genre: "Fantasy"
      )
      @book_7 = @lib_2.books.create!(
        title: "Dungeon Master's Guide",
        genre: "Fantasy"
      )
      @book_1 = @lib_2.books.create!(
        title: "Ender's Game",
        genre: "Science Fiction"
      )


      @author_2 = Author.create!(
        name: "Carmen",
        dob: DateTime.new(1953),
        deathyear: DateTime.new(2018)
      )
      @book_author_3 = BookAuthor.create!(
        book_id: @book_3.id,
        author_id: @author_2.id,
      )
      @book_author_4 = BookAuthor.create!(
        book_id: @book_9.id,
        author_id: @author_2.id,
      )
      @book_author_5 = BookAuthor.create!(
        book_id: @book_1.id,
        author_id: @author_2.id,
      )

      @author_1 = Author.create!(
        name: "Fizban",
        dob: DateTime.new(1003),
        deathyear: DateTime.new(2022)
      )
      @book_author_1 = BookAuthor.create!(
        book_id: @book_5.id,
        author_id: @author_1.id,
      )
      @book_author_2 = BookAuthor.create!(
        book_id: @book_7.id,
        author_id: @author_1.id,
      )

      @author_3 = Author.create!(
        name: "Earl",
        dob: DateTime.new(1949),
        deathyear: DateTime.new(2007)
      )
      @book_author_1 = BookAuthor.create!(
        book_id: @book_1.id,
        author_id: @author_3.id,
      )
    end

    it '#avg_author_age' do
      expect(@book_1.avg_author_age).to eq(61)
      expect(@book_5.avg_author_age).to eq(1019)
      expect(@book_3.avg_author_age).to eq(65)
    end
  end
end