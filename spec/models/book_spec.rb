require "rails_helper"

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :genre }
  end

  describe "relationships" do
    it { should belong_to :library }
    it { should have_many :author_books }
    it { should have_many (:authors).through(:author_books) }
  end
end
