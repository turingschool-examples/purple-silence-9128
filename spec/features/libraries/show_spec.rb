require "rails_helper"

RSpec.describe "Library Show Page" do
  before :each do
    @library = Library.create!(name: "Denver Public Library")
    @diff_lib = Library.create!(name: "Rino Private Library")
    @author_1 = Author.create!(name: "Jon Krakauer", birth_year: 1975)
    @author_2 = Author.create!(name: "Barbara Oakley, Ph.D.", birth_year: 1982)
    @author_3 = Author.create!(name: "Jon Mulaney", birth_year: 1989)
    @book_1 = @library.books.create!(title: "Into the Wild", genre: "Non-Fiction")
    @book_2 = @library.books.create!(title: "a Mind for Numbers", genre: "Non-Fiction")
    @ab_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @ab_3 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_2.id)

    visit "/libraries/#{@library.id}"
  end

  it "shows name of library" do
    expect(page).to have_content("Denver Public Library")
    expect(page).to_not have_content("Rino Private Library")

    click_link "All Authors"
    expect(current_path).to eq("/libraries/#{@library.id}/authors")
    expect(page).to have_content("Jon Krakauer")
    expect(page).to have_content("Barbara Oakley, Ph.D.")
  end
end
