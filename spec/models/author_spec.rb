require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'methods' do
    it '::average_age' do
      @author1 = Author.create!(name: "made_up_specific_name", age: "15")
      @author2 = Author.create!(name: "made_up_specific_name", age: "45")
      @author3 = Author.create!(name: "made_up_specific_name", age: "40")
      @author4 = Author.create!(name: "made_up_specific_name", age: "20")

      expect(Author.where(name: "made_up_specific_name").average_age).to eq(30)
    end
  end
end
