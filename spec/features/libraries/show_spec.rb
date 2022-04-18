require 'rails_helper'

RSpec.describe 'the library show page' do
  before do
    @library_1 = Library.create!(name: "Richmond Public Library")
    @library_2 = Library.create!(name: "Henrico Public Library")

    @book_1 = @library_1.books.create!(title: "Book One", genre: "Finance")
    @book_2 = @library_1.books.create!(title: "Book Two", genre: "Horror")
    @book_3 = @library_2.books.create!(title: "No Title", genre: "No Genre")
    ### Extension books
    @book_4 = @library_1.books.create!(title: "Book Four", genre: "Extension")
    @book_5 = @library_1.books.create!(title: "Book Five", genre: "Extension")
    @book_6 = @library_1.books.create!(title: "Book Six", genre: "Extension")
    @book_7 = @library_1.books.create!(title: "Book Seven", genre: "Extension")

    @author_1 = Author.create!(name: "Amanda Hugankiss", birth_year: DateTime.new(1984))
    @author_2 = Author.create!(name: "Fanny McPatdown", birth_year: DateTime.new(1950))
    @author_3 = Author.create!(name: "Mr. Evil", birth_year: DateTime.new(1969))
    ###Extension Authors
    @author_4 = Author.create!(name: "Sid Vicious", birth_year: DateTime.new(1984))
    @author_5 = Author.create!(name: "Sally Buttercup", birth_year: DateTime.new(1991))

    @author_book_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @author_book_2 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_1.id)
    @author_book_3 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_2.id)
    @author_book_4 = AuthorBook.create!(author_id: @author_3.id, book_id: @book_3.id)
    ###Extension AuthorBooks
    @author_book5 = AuthorBook.create!(author_id: @author_4.id, book_id: @book_4.id)
    @author_book6 = AuthorBook.create!(author_id: @author_4.id, book_id: @book_5.id)
    @author_book7 = AuthorBook.create!(author_id: @author_5.id, book_id: @book_6.id)
    @author_book8 = AuthorBook.create!(author_id: @author_5.id, book_id: @book_7.id)
    visit "/libraries/#{@library_1.id}"
  end

  it 'shows the name of that library' do
    expect(page).to have_content("Richmond Public Library")
    expect(page).to_not have_content("Henrico Public Library")
  end

  it 'has a link to view all the authors that have books at that library' do
    within('#authors') do
      expect(page).to have_link("Authors available at Richmond Public Library")
      click_link("Authors available at Richmond Public Library")
      expect(current_path).to eq("/libraries/#{@library_1.id}/authors")
    end
  end

  it 'displays the three most popular authors available at that library' do
    within('#three_most_popular_authors') do
      expect(page).to have_content("Sid Vicious")
      expect(page).to have_content("Sally Buttercup")
      expect(page).to have_content("Fanny McPatdown")
      expect(page).to_not have_content("Amanda Hugankiss")
      expect(page).to_not have_content("Mr. Evil")
    end
  end
end
