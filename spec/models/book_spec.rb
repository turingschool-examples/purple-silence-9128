require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :author_books }
    it { should have_many(:authors).through(:author_books) }
  end

  describe 'instance methods' do
    before :each do
      @library_1 = Library.create!(name: 'Denver Public Library')
      @library_2 = Library.create!(name: 'Aurora Public Library')

      @book_1 = @library_1.books.create!(title: 'Epic Quest', genre: 'Adventure')
      @book_2 = @library_2.books.create!(title: 'The Haunted Mansion', genre: 'Horror')

      @author_1 = Author.create!(name: 'Gilgamesh', age: 555)
      @author_1a = Author.create!(name: 'Guthix', age: 657)
      @author_2 = Author.create!(name: 'Saradomin', age: 950)

      @book_1.author_books.create!(author_id: @author_1.id)
      @book_1.author_books.create!(author_id: @author_1a.id)
      @book_2.author_books.create!(author_id: @author_2.id)
    end

    context 'user story 2' do
      it '.average_age_of_authors' do
        expect(@book_1.average_age_of_authors).to eq(606)
      end
    end
  end
end
