require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :books }
    it { should have_many(:authors).through(:books) }
  end

  describe 'instance methods' do
    it '#most_popular_authors' do
      @library = Library.create!(name: "Milton Public Library")

      @book1 = @library.books.create!(title: "Eat Good Food", genre: "Travel")
      @book2 = @library.books.create!(title: "A History of Africa", genre: "history")
      @book3 = @library.books.create!(title: "Things to Know about Cults", genre: "non-fiction")
      @book4 = @library.books.create!(title: "My Boring Life", genre: "autobiography")
      @book5 = @library.books.create!(title: "The Dark Side of History", genre: "history")
      @book6 = @library.books.create!(title: "Shoestring Travel", genre: "travel")

      @author1 = Author.create!(name: "James McFace", birth_year: 1971)
      @author2 = Author.create!(name: "Angela Noseberry", birth_year: 1980)
      @author3 = Author.create!(name: "Shelly Farminghoe", birth_year: 1994)
      @author4 = Author.create!(name: "Percy Norris Cheesecake", birth_year: 1973)
      @author5 = Author.create!(name: "Jessie Junglejams", birth_year: 1988)

      BookAuthor.create!(book: @book1, author: @author1)
      BookAuthor.create!(book: @book1, author: @author4)

      BookAuthor.create!(book: @book2, author: @author2)
      BookAuthor.create!(book: @book2, author: @author3)
      BookAuthor.create!(book: @book2, author: @author4)

      BookAuthor.create!(book: @book3, author: @author3)

      BookAuthor.create!(book: @book4, author: @author5)
      BookAuthor.create!(book: @book4, author: @author3)

      BookAuthor.create!(book: @book5, author: @author2)
      BookAuthor.create!(book: @book5, author: @author4)

      BookAuthor.create!(book: @book6, author: @author3)
      BookAuthor.create!(book: @book6, author: @author2)

      expect(@library.most_popular_authors).to eq([@author3, @author2, @author4])
    end
  end

end
