require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:author_books).through(:books) }
    it { should have_many(:authors).through(:author_books) }
  end


  describe 'instance methods' do
    context 'extension' do
      before do
        @library_1 = Library.create!(name: 'Denver Public Library')
        @library_2 = Library.create!(name: 'Aurora Public Library')

        @book_1 = @library_1.books.create!(title: 'Epic Quest', genre: 'Adventure')
        @book_2 = @library_1.books.create!(title: 'Epic Quest 2', genre: 'Adventure')
        @book_3 = @library_1.books.create!(title: 'The Haunted Mansion', genre: 'Horror')
        @book_4 = @library_1.books.create!(title: 'The Haunted Mansion 2', genre: 'Horror')
        @book_5 = @library_2.books.create!(title: 'The Never Ending Story', genre: 'Adventure')
        @book_6 = @library_2.books.create!(title: 'The Never Ending Story: The End', genre: 'Adventure')

        @author_1 = Author.create!(name: 'Gilgamesh', age: 555)
        @book_1.author_books.create!(author_id: @author_1.id)
        @book_2.author_books.create!(author_id: @author_1.id)

        @author_2 = Author.create!(name: 'Guthix', age: 657)
        @book_1.author_books.create!(author_id: @author_2.id)
        @book_2.author_books.create!(author_id: @author_2.id)
        @book_3.author_books.create!(author_id: @author_2.id)

        @author_3 = Author.create!(name: 'Saradomin', age: 950)
        @book_1.author_books.create!(author_id: @author_3.id)
        @book_2.author_books.create!(author_id: @author_3.id)
        @book_3.author_books.create!(author_id: @author_3.id)
        @book_4.author_books.create!(author_id: @author_3.id)

        @author_4 = Author.create!(name: 'Zamorak', age: 950)
        @book_4.author_books.create!(author_id: @author_4.id)
        @book_5.author_books.create!(author_id: @author_4.id)
        @book_6.author_books.create!(author_id: @author_4.id)
      end

      it '.top_3_authors returns best 3 authors based on count of books in the library' do
        expect(@library_1.top_3_authors.sort).to eq([@author_3, @author_2, @author_1].sort)
      end
    end
  end
end
