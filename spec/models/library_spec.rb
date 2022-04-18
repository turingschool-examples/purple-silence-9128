require 'rails_helper'

RSpec.describe Library, type: :model do
  before :all do
    @library = Library.create!(name: "Big Ass Library")
    @small_library = Library.create!(name: "Small Ass Library")

    @book_1 = @library.books.create!(title: "Put This Book Down and Do Your IC", genre: "Nonfiction")
    @book_2 = @library.books.create!(title: "For God's Sake Don't Read This", genre: "Fiction")

    @thiccums = Author.create!(name: "H.T. Thiccums", birth_year: 1904)
    @hiccups = Author.create!(name: "J.R. Hiccups", birth_year: 2017)
    @bad_author = Author.create!(name: "I.Am. Terrible", birth_year: 1847)
    @strange_author = Author.create!(name: "Wiggles McDoofus", birth_year: 1975)

    @ab_1 = AuthorBook.create!(author_id: @thiccums.id, book_id: @book_1.id)
    @ab_2 = AuthorBook.create!(author_id: @hiccups.id, book_id: @book_1.id)
    @ab_3 = AuthorBook.create!(author_id: @bad_author.id, book_id: @book_2.id)
    @ab_4 = AuthorBook.create!(author_id: @strange_author.id, book_id: @book_2.id)
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many :author_books }
    it { should have_many :authors }
  end
end
