require 'rails_helper'

RSpec.describe "Library's Authors #Index" do

  before :each do
    @library1 = Library.create!(name: "Fletcher Free Library")
    @library2 = Library.create!(name: "Westminster Branch")
    @book1 = @library1.books.create!(title: "What if?", genre: "non-fiction")
    @book2 = @library2.books.create!(title: "Waterways", genre: "young-adult")
    @book3 = @library1.books.create!(title: "Peterson's Guide to North American Birds", genre: "non-fiction")
    @author1 = Author.create!(name: "Randal Munroe", age: 52)
    @author2 = Author.create!(name: "Kelly Gold", age: 46)
    @author3 = Author.create!(name: "John Peterson", age: 98)
    @author4 = Author.create!(name: "James Audubon", age: 103)
    @association1 = BookAuthor.create(author_id: @author1.id, book_id: @book1.id)
    @association2 = BookAuthor.create(author_id: @author2.id, book_id: @book2.id)
    @association3 = BookAuthor.create(author_id: @author3.id, book_id: @book3.id)
    @association4 = BookAuthor.create(author_id: @author4.id, book_id: @book3.id)
  end

  it "links from the library show page and display's all of that library's authors" do
    visit "/libraries/#{@library1.id}/"

    click_link("View #{@library1.name}'s authors")

    expect(current_path).to eq("/libraries/#{@library1.id}/authors/")
    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@author3.name)
    expect(page).to have_content(@author4.name)


    expect(page).not_to have_content(@author2.name)
  end
end
