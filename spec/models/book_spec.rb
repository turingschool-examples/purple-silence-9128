require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
  end

  describe 'methods' do
    before do
      @library_1 = Library.create!(name: "Library One")
      @library_2 = Library.create!(name: "Free Book Place")

      @book_1 = @library_1.books.create!(
        title: "Book On Livin'",
        genre: "Self Help"
      )
      @book_2 = @library_1.books.create!(
        title: "Book On Dyin'",
        genre: "Horror"
      )
      @book_3 = @library_2.books.create!(
        title: "Nothing Book",
        genre: "Nothing"
      )

      @author_1 = Author.create!(
        name: "Smart Happy Guy",
        age: 35
      )
      @author_2 = Author.create!(
        name: "Great Silly Guy",
        age: 20
      )
      @author_3 = Author.create!(
        name: "Not A Good Guy",
        age: 125
      )

      @book_author_1 = BookAuthor.create!(
        book_id: @book_1.id,
        author_id: @author_1.id,
      )
      @book_author_2 = BookAuthor.create!(
        book_id: @book_1.id,
        author_id: @author_2.id,
      )
      @book_author_3 = BookAuthor.create!(
        book_id: @book_2.id,
        author_id: @author_2.id,
      )
      @book_author_4 = BookAuthor.create!(
        book_id: @book_3.id,
        author_id: @author_3.id,
      )
    end

    describe 'instance methods' do
      it '#avg_author_age claculates avg author age' do
        expect(@book_1.avg_author_age).to eq(27)
        expect(@book_2.avg_author_age).to eq(20)
        expect(@book_3.avg_author_age).to eq(125)
      end
    end
  end
end
