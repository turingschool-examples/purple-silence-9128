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

  describe 'instance methods' do
    it 'calculates #average_age' do
      author = Author.create!(name: 'Archie Long Fur', birth_year: 1990)
      author_2 = Author.create!(name: 'Luna Twoolie', birth_year: 1992)

      expect(Author.average_age).to eq(31)
    end
  end
end
