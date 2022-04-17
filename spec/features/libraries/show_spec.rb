require 'rails_helper'

RSpec.describe 'libraries show page' do
  describe 'as a user' do
    describe 'when i visit a librarys show page' do
      it 'i see the name of that library' do
        library_1 = Library.create!(name: "Round Hill Public Library")
        book_1 = library_1.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction")
        book_2 = library_1.books.create!(title: "The Secret History", genre: "Mystery")
        author_1 = book_1.authors.create!(name: "Kurt Vonnegut", birth_year: 1922)
        author_2 = book_1.authors.create!(name: "Kilgore Trout", birth_year: 1908)
        author_3 = book_2.authors.create!(name: "Donna Tartt", birth_year: 1963)

        library_2 = Library.create!(name: "Purcelville Public Library")
        book_3 = library_2.books.create!(title: "The Lord of the Rings", genre: "Fantasy")
        author_4 = book_3.authors.create!(name: "The Lord of the Rings", birth_year: 1892)

        visit "/libraries/#{library_1.id}"

        expect(page).to have_content(library_1.name)
        expect(page).not_to have_content(library_2.name)
      end

      it 'and i see a link to view all of the authors that have written book_authors
          that the library has, which redirects me to the librarys authors index
          page, which shows a unique list of names of all the authors that the
          library has' do
        library_1 = Library.create!(name: "Round Hill Public Library")
        book_1 = library_1.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction")
        book_2 = library_1.books.create!(title: "The Secret History", genre: "Mystery")
        author_1 = book_1.authors.create!(name: "Kurt Vonnegut", birth_year: 1922)
        author_2 = book_1.authors.create!(name: "Kilgore Trout", birth_year: 1908)
        author_3 = book_2.authors.create!(name: "Donna Tartt", birth_year: 1963)

        library_2 = Library.create!(name: "Purcelville Public Library")
        book_3 = library_2.books.create!(title: "The Lord of the Rings", genre: "Fantasy")
        author_4 = book_3.authors.create!(name: "JRR Tolkien", birth_year: 1892)

        visit "/libraries/#{library_1.id}"

        click_link "Authors at This Library"

        expect(current_path).to eq("/libraries/#{library_1.id}/authors")

        expect(page).to have_content(author_1.name).once
        expect(page).to have_content(author_2.name).once
        expect(page).to have_content(author_3.name).once
        expect(page).not_to have_content(author_4.name)
      end

      it 'i see the three most popular authors that are available in the library' do
        library_1 = Library.create!(name: "Round Hill Public Library")

        author_1 = Author.create!(name: "Kurt Vonnegut", birth_year: 1922)
        author_1.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction", library_id: library_1.id)
        author_1.books.create!(title: "Cat's Cradle", genre: "Science Fiction", library_id: library_1.id)

        author_2 = Author.create!(name: "Donna Tartt", birth_year: 1963)
        author_2.books.create!(title: "The Goldfinch", genre: "Fiction", library_id: library_1.id)
        author_2.books.create!(title: "The Little Friend", genre: "Fiction", library_id: library_1.id)
        author_2.books.create!(title: "The Secret History", genre: "Fiction", library_id: library_1.id)

        author_3 = Author.create!(name: "JRR Tolkien", birth_year: 1963)
        author_3.books.create!(title: "The Lord of the Rings", genre: "Fantasy", library_id: library_1.id)

        author_4 = Author.create!(name: "TC Boyle", birth_year: 1963)
        author_4.books.create!(title: "The Harder They Come", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "Outside Looking In", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "When The Killing's Done", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "World's End", genre: "Fiction", library_id: library_1.id)
        author_4.books.create!(title: "The Tortilla Curtain", genre: "Fiction", library_id: library_1.id)

        author_5 = Author.create!(name: "John Steinbeck", birth_year: 1963)
        author_5.books.create!(title: "The Grapes of Wrath", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "East of Eden", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "Of Mice and Men", genre: "Fiction", library_id: library_1.id)
        author_5.books.create!(title: "In Dubious Battles", genre: "Fiction", library_id: library_1.id)

        author_6 = Author.create!(name: "CS Lewis", birth_year: 1963)
        author_6.books.create!(title: "The Screwtape Letters", genre: "Fiction", library_id: library_1.id)

        library_2 = Library.create!(name: "Purcelville Public Library")
        author_7 = Author.create(name: "George RR Martin", birth_year: 1948)
        author_7.books.create!(title: "A Game of Thrones", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Clash of Kings", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Storm of Swords", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Feast for Crows", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "A Dance with Dragons", genre: "Fantasy", library_id: library_2.id)
        author_7.books.create!(title: "The World of Ice and Fire", genre: "Fantasy", library_id: library_2.id)

        visit "/libraries/#{library_1.id}"

        within "#most_popular_authors" do
          expect(author_4.name).to appear_before(author_5.name)
          expect(author_5.name).to appear_before(author_2.name)
          expect(page).not_to have_content(author_1.name)
          expect(page).not_to have_content(author_3.name)
          expect(page).not_to have_content(author_6.name)
          expect(page).not_to have_content(author_7.name)
        end
      end
    end
  end
end
