require 'rails_helper'
RSpec.describe 'the library authors index page' do

  before do
    @library_1 = Library.create!(name: "Richmond Public Library")
    @library_2 = Library.create!(name: "Henrico Public Library")
    @book_1 = @library_1.books.create!(title: "Book One", genre: "Finance")
    @book_2 = @library_1.books.create!(title: "Book Two", genre: "Horror")
    @book_3 = @library_2.books.create!(title: "No Title", genre: "No Genre")
    @author_1 = Author.create!(name: "Amanda Hugankiss", birth_year: DateTime.new(1984))
    @author_2 = Author.create!(name: "Fanny McPatdown", birth_year: DateTime.new(1950))
    @author_3 = Author.create!(name: "Mr. Evil", birth_year: DateTime.new(1969))
    @author_book_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
    @author_book_2 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_1.id)
    @author_book_3 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_2.id)
    @author_book_4 = AuthorBook.create!(author_id: @author_3.id, book_id: @book_3.id)
    visit "/libraries/#{@library_1.id}/authors"
  end

  it 'displays a list of all authors at that library' do
    expect(page).to have_content("Amanda Hugankiss", count: 1)
    expect(page).to have_content("Fanny McPatdown", count: 1)
    expect(page).to_not have_content("Mr. Evil")
  end
end
