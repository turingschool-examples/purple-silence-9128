require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :author_books }
    it { should have_many(:books).through(:author_books) }
  end 

  describe 'class methods' do 
    describe '#average_author_age' do 
      it 'calculates the average author age to 1/10 decimal' do 
        author1 = Author.create!(name: 'Stephen King', birth_year: 1947)
        author2 = Author.create!(name: 'Peter Straub', birth_year: 1943)
        author3 = Author.create!(name: 'Cixin Liu', birth_year: 1963)

        expect(Author.author_average_age).to eq(71)
      end
    end
  end
end
