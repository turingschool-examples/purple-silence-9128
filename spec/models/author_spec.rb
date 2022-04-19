require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :dob }
  end

  describe 'relationships' do
    it { should have_many :book_authors }
    it { should have_many :books }
  end

  describe 'methods' do
    before do
      @author_2 = Author.create!(
        name: "Carmen",
        dob: DateTime.new(1953),
        deathyear: DateTime.new(2018)
      )
      @author_1 = Author.create!(
        name: "Fizban",
        dob: DateTime.new(1003),
        deathyear: DateTime.new(2022)
      )
      @author_3 = Author.create!(
        name: "Earl",
        dob: DateTime.new(1949),
        deathyear: DateTime.new(2007)
      )
    end

    it '#age calucates age of each author' do
      expect(@author_2.age).to eq(65)
      expect(@author_3.age).to eq(58)
      expect(@author_1.age).to eq(1019)
    end
  end
end
