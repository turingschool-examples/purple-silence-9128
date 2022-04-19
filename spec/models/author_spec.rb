require "rails_helper"

RSpec.describe Author, type: :model do
  describe "relationships" do
    it {should have_many :books}
  end

  describe "methods" do
    it "can find the average age" do
      joseph = Author.create!(name: "Joseph", birth_year: 1985)
      lee = Author.create!(name: "Lee", birth_year: 1983)

      expect(Author.average_age).to eq(38)
    end

    it "lists the unique authors" do
      @central = Library.create!(name: "Central Public Library")

      @hobbit = @central.books.create!(title: "The Hobbit", genre: "Fantasy")
      @fellowship = @central.books.create!(title: "The Fellowship of the Ring", genre: "Fantasy")
      @towers = @central.books.create!(title: "The Two Towers", genre: "Fantasy")
      @wrinkle = @central.books.create!(title: "A Wrinkle in Time", genre: "Fantasy")
      @wind = @central.books.create!(title: "A Wind in the Door", genre: "Fantasy")
      @oz = @central.books.create!(title: "The Wonderful Wizard of Oz", genre: "Fantasy")

      @tolkien = Author.create!(name: "Tolkien", birth_year: 1886)
      @fake = Author.create!(name: "Faker", birth_year: 1906)
      @engle = Author.create!(name: "L'Engle", birth_year: 1946)
      @baum = Author.create!(name: "Baum", birth_year: 1883)

      @ab1 = AuthorBook.create!(book_id: @hobbit.id, author_id: @tolkien.id)
      @ab2 = AuthorBook.create!(book_id: @wrinkle.id, author_id: @engle.id)
      @ab3 = AuthorBook.create!(book_id: @hobbit.id, author_id: @fake.id)
      @ab4 = AuthorBook.create!(book_id: @fellowship.id, author_id: @tolkien.id)
      @ab5 = AuthorBook.create!(book_id: @towers.id, author_id: @tolkien.id)
      @ab6 = AuthorBook.create!(book_id: @wind.id, author_id: @engle.id)
      @ab7 = AuthorBook.create!(book_id: @oz.id, author_id: @baum.id)

      expect(Author.list_of_authors).to eq([@baum, @fake, @engle, @tolkien])
    end

    it "can find the most popular author" do
      @central = Library.create!(name: "Central Public Library")

      @hobbit = @central.books.create!(title: "The Hobbit", genre: "Fantasy")
      @fellowship = @central.books.create!(title: "The Fellowship of the Ring", genre: "Fantasy")
      @towers = @central.books.create!(title: "The Two Towers", genre: "Fantasy")
      @wrinkle = @central.books.create!(title: "A Wrinkle in Time", genre: "Fantasy")
      @wind = @central.books.create!(title: "A Wind in the Door", genre: "Fantasy")
      @oz = @central.books.create!(title: "The Wonderful Wizard of Oz", genre: "Fantasy")

      @tolkien = Author.create!(name: "Tolkien", birth_year: 1886)
      @fake = Author.create!(name: "Faker", birth_year: 1906)
      @engle = Author.create!(name: "L'Engle", birth_year: 1946)
      @baum = Author.create!(name: "Baum", birth_year: 1883)

      @ab1 = AuthorBook.create!(book_id: @hobbit.id, author_id: @tolkien.id)
      @ab2 = AuthorBook.create!(book_id: @wrinkle.id, author_id: @engle.id)
      @ab3 = AuthorBook.create!(book_id: @hobbit.id, author_id: @fake.id)
      @ab4 = AuthorBook.create!(book_id: @fellowship.id, author_id: @tolkien.id)
      @ab5 = AuthorBook.create!(book_id: @towers.id, author_id: @tolkien.id)
      @ab6 = AuthorBook.create!(book_id: @wind.id, author_id: @engle.id)
      @ab7 = AuthorBook.create!(book_id: @oz.id, author_id: @baum.id)


    end
  end
end
