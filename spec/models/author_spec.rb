require "rails_helper"

RSpec.describe Author, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
    it { should validate_numericality_of(:birth_year) }
  end

  describe "relationships" do
    it { should have_many(:books).through(:book_authors) }
    it { should have_many(:libraries).through(:books) }
  end
end
