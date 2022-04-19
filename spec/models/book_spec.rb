require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end
  
  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :authors}
  end 

  describe 'instance methods' do
    it 'returns average age of authors' do 
        lib = Library.create!(name: "DCL")
        @book1 = lib.books.create!(title: "Where Red Fern", genre: 'fiction')
        @author1 = Author.create!(name: "Rick", birth_year: 1990)
        @author2 = Author.create!(name: "Tom", birth_year: 1992)
        BookAuthor.create(book_id: @book1.id, author_id: @author1.id)
        BookAuthor.create(book_id: @book1.id, author_id: @author2.id)

        expect(@book1.average_age).to eq(31)

    end
  end
end