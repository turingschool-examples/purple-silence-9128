require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'class methods' do
    it '.average_age' do
      Author.create!(name: "Joe Goodman", birth_year: 1982) # 40
      Author.create!(name: "Joe Goodman", birth_year: 1962) # 60
      Author.create!(name: "Joe Goodman", birth_year: 1995) # 27
      Author.create!(name: "Joe Goodman", birth_year: 1979) # 43
      Author.create!(name: "Joe Goodman", birth_year: 1988) # 34

      expect(Author.average_age).to eq(40.8)
      expect(Author.average_age).not_to eq(41)
    end
  end
end
