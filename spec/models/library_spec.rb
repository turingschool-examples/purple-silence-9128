require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:book_authors).through(:books) }
    it { should have_many(:authors).through(:book_authors) }

  end
end
