require 'rails_helper'

RSpec.describe 'Books#Show' do
  before :each do
    @library1 = Library.create!(name: "Central Branch")
    @library2 = Library.create!(name: "Green Valley Ranch")

    @book1 = @library1.books.create!(title: "Cryptonomicon", genre: "science fiction")
    @book2 = @library1.books.create!(title: "Seveneves", genre: "science fiction")
    @book3 = @library1.books.create!(title: "Fantastic Creatures and Where to Locate Them", genre: "fantasy")
    @book4 = @library1.books.create!(title: "Harry and The Philosopher's Gem", genre: "fantasy")
    @book5 = @library2.books.create!(title: "What if?", genre: "non fiction")

    @author1 = Author.create!(name: "Jannis Raowlins", age: 45)
    @author2 = Author.create!(name: "Neele Stephens", age: 57)
    @author3 = Author.create!(name: "Randall Munroe", age: 52)
    @author4 = Author.create!(name: "NASA JPL", age: 86)

    association1 = BookAuthor.create!(book_id: @book1.id, author_id: @author2.id)
    association1 = BookAuthor.create!(book_id: @book2.id, author_id: @author2.id)
    association1 = BookAuthor.create!(book_id: @book3.id, author_id: @author1.id)
    association1 = BookAuthor.create!(book_id: @book4.id, author_id: @author1.id)
    association1 = BookAuthor.create!(book_id: @book5.id, author_id: @author3.id)
    association1 = BookAuthor.create!(book_id: @book5.id, author_id: @author4.id)

  end

  it "displays a book's title, genre, and a list of all authors" do
    visit "/books/@book1.id"

    expect(page).to have_contents(@book1.title)
    expect(page).to have_contents(@book1.genre)
    expect(page).to have_contents(@book1.authors[0].name)

    visit "/books/@book2.id"

    expect(page).to have_contents(@book2.title)
    expect(page).to have_contents(@book2.genre)
    expect(page).to have_contents(@book2.authors[0].name)

    visit "/books/@book3.id"

    expect(page).to have_contents(@book3.title)
    expect(page).to have_contents(@book3.genre)
    expect(page).to have_contents(@book3.authors[0].name)

    visit "/books/@book4.id"

    expect(page).not_to have_contents(@book1.title)
    expect(page).not_to have_contents(@book2.title)
    expect(page).not_to have_contents(@book3.title)

    visit "/books/@book5.id"

    expect(page).to have_contents(@book1.title)
    expect(page).to have_contents(@book1.genre)
    expect(page).to have_contents(@book1.authors[0].name)
    expect(page).to have_contents(@book1.authors[1].name)
  end
end
