require 'rails_helper'

RSpec.describe 'libraries show page' do
  describe 'as a user' do
    describe 'when i visit a librarys show page' do
      before :each do
        @library_1 = Library.create!(name: "Round Hill Public Library")
        @book_1 = @library_1.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction")
        @book_2 = @library_1.books.create!(title: "The Secret History", genre: "Mystery")
        @author_1 = @book_1.authors.create!(name: "Kurt Vonnegut", birth_year: 1922)
        @author_2 = @book_1.authors.create!(name: "Kilgore Trout", birth_year: 1908)
        @author_3 = @book_2.authors.create!(name: "Donna Tartt", birth_year: 1963)

        @library_2 = Library.create!(name: "Purcelville Public Library")
        @book_3 = @library_2.books.create!(title: "The Lord of the Rings", genre: "Fantasy")
        @author_4 = @book_3.authors.create!(name: "The Lord of the Rings", birth_year: 1892)
        visit "/libraries/#{@library_1.id}"
      end

      it 'i see the name of that library' do
        expect(page).to have_content(@library_1.name)
        expect(page).not_to have_content(@library_2.name)
      end

      it 'and i see a link to view all of the authors that have written book_authors
          that the library has, which redirects me to the librarys authors index
          page, which shows a unique list of names of all the authors that the
          library has' do
        click_link "Authors at This Library"

        expect(current_path).to eq("/libraries/#{@library_1.id}/authors")

        expect(page).to have_content(@author_1.name)
        expect(page).to have_content(@author_2.name)
        expect(page).to have_content(@author_3.name)
        expect(page).not_to have_content(@author_4.name)
      end
    end
  end
end
