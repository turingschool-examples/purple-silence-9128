require 'rails_helper'

RSpec.describe "library show page", type: :feature do
  before (:each) do
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

    @library2 = Library.create!(name: "Waterfall Library")
    @book7 = @library2.books.create!(title: "No Goats Here", genre: "romance")
    @author6 = Author.create!(name: "Mandy Pollyana", birth_year: 1984)
    BookAuthor.create!(book: @book7, author: @author6)
  end

  it 'shows the library info and a link to the authors' do
    visit "/libraries/#{@library.id}"
    expect(page).to have_content(@library.name)
    expect(page).not_to have_content(@library2.name)

    click_link("Authors")
    expect(current_path).to eq("/libraries/#{@library.id}/authors")

    expect(page).to have_content(@author1.name, count: 1)
    expect(page).to have_content(@author2.name, count: 1)
    expect(page).to have_content(@author3.name, count: 1)
    expect(page).to have_content(@author4.name, count: 1)
    expect(page).to have_content(@author5.name, count: 1)
    expect(page).not_to have_content(@author6.name)
  end

  it 'shows the 3 most popular authors' do
    visit "/libraries/#{@library.id}"

    within ".popular_authors" do
      expect(page).to have_content(@author3.name)
      expect(page).to have_content(@author2.name)
      expect(page).to have_content(@author4.name)
      expect(page).not_to have_content(@author1.name)
      expect(page).not_to have_content(@author5.name)
    end
  end
end
