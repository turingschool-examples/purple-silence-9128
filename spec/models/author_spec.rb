require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
  end

  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many :books }
  end

  describe 'methods' do
    before do
      @author_1 = Author.create!(
        name: "Smart Happy Guy",
        birth_year: DateTime.new(1987)
      )
      @author_2 = Author.create!(
        name: "Great Silly Guy",
        birth_year: DateTime.new(2002)
      )
      @author_3 = Author.create!(
        name: "Not A Good Guy",
        birth_year: DateTime.new(1887)
      )
    end

    describe 'instance methods' do
      it '#age calculates age based on birth year' do
        expect(@author_1.age).to eq(35)
        expect(@author_2.age).to eq(20)
        expect(@author_3.age).to eq(135)
      end
    end
  end
end
