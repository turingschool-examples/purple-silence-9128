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
    before :each do
      @library1 = Library.create!(name: "Ferretpedia")

      @book1 = @library1.books.create!(title: "Book of END", genre: "Shounen")

      @author1 = Author.create!(name: "Pabu", birth_year: 2020)
      @author2 = Author.create!(name: "Zeref", birth_year: 1980)
      @author3 = Author.create!(name: "Ian", birth_year: 2000)

      @ba1 = BookAuthor.create!(book_id: @book1.id, author_id: @author1.id)
      @ba2 = BookAuthor.create!(book_id: @book1.id, author_id: @author2.id)
      @ba2 = BookAuthor.create!(book_id: @book1.id, author_id: @author3.id)
    end

    it 'has author average age' do
      expect(2022 - @book1.average_age).to eq(22)
    end
  end
end
