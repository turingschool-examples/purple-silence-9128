require "rails_helper"

describe "Book Show", type: :feature do
  before(:each) do
    @library1 = Library.create!(name: "The Library")
    @book1 = Book.create!(title: "Good Book", genre: "Mystery", library: @library1)
    @author1 = Author.create!(name: "Good Author", age: 41)
    @author3 = Author.create!(name: "Best Author", age: 51)
    @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
    @author_book3 = AuthorBook.create!(author: @author3, book: @book1)

    @book2 = Book.create!(title: "Bad Book", genre: "Horror", library: @library1)
    @author2 = Author.create!(name: "Bad Author", age: 31)
    @author_book2 = AuthorBook.create!(author: @author2, book: @book2)
  end
  it "displays book name and genre" do

    visit "/books/#{@book1.id}"

    expect(page).to have_content("Good Book")
    expect(page).to have_content("Mystery")
    expect(page).to_not have_content("Bad Book")
    expect(page).to_not have_content("Horror")
  end

  it "displays book authors" do
    visit "/books/#{@book1.id}"

    expect(page).to have_content("Good Author")
    expect(page).to have_content(41)
    expect(page).to_not have_content("Bad Author")
    expect(page).to_not have_content(31)
  end
end
