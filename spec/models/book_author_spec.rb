require "rails_helper"

RSpec.describe BookAuthor, type: :model do
  describe "validations" do
    it { should belong_to(:book) }
    it { should belong_to(:author) }
  end
end
