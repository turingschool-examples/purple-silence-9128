require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'class methods' do
    it '#avg_age' do
      author_1 = Author.create!(name: 'Sally Samson', birth_year: 1885)
      author_2 = Author.create!(name: 'Henry Hicks', birth_year: 1776)
      author_3 = Author.create!(name: 'Percy Priest', birth_year: 1993)
      author_4 = Author.create!(name: 'Davy Dixon', birth_year: 1954)

      expect(Author.avg_age).to eq(120)
    end
  end
end
