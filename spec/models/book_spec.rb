require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end
  
  describe 'relationships' do
    it { should belong_to :library }
    it { should have_many :authors }
  end 

  describe 'methods' do

    it 'Has a method to determine average age of authors' do
      library_1 = Library.create!(name: "Wake Forest Public Library")
      book_1 = Book.create!(title: "Dragons of Autumn Twilight", genre: "Fantasy", library_id: library_1.id)
      author_1 = Author.create!(name: "Margaret Weis", birth_year: 1948)
      author_2 = Author.create!(name: "Tracy Hickman", birth_year: 1955)
      author_book_1 = AuthorsBook.create!(author_id: author_1.id, book_id: book_1.id)
      author_book_2 = AuthorsBook.create!(author_id: author_2.id, book_id: book_1.id)

      actual = book_1.average_author_age
      expected = 70

      expect(actual).to eq(expected)
    end
  end
end