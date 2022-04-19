require "rails_helper"

describe "Library Show", type: :feature do
  before(:each) do
    @library1 = Library.create!(name: "The Library")
    @book1 = Book.create!(title: "Good Book", genre: "Mystery", library: @library1)
    @author1 = Author.create!(name: "Good Author", age: 41)
    @author3 = Author.create!(name: "Best Author", age: 51)
    @author_book1 = AuthorBook.create!(author: @author1, book: @book1)
    @author_book3 = AuthorBook.create!(author: @author3, book: @book1)

    @library2 = Library.create!(name: "Cursed Library")
    @book2 = Book.create!(title: "Bad Book", genre: "Horror", library: @library1)
    @author2 = Author.create!(name: "Bad Author", age: 31)
    @author_book2 = AuthorBook.create!(author: @author2, book: @book2)
  end
  it "links to library index" do

    visit "/libraries/#{@library1.id}"

    expect(page).to have_content("The Library")
    expect(page).to have_link("All Authors")
    expect(page).to_not have_content("Cursed Library")

    click_link("All Authors")

    expect(page).to have_current_path("/libraries/#{@library1.id}/authors")

  end
end
