require 'rails_helper'

RSpec.describe 'books show page' do
  describe 'as a user' do
    describe 'when i visit a books show page' do
      before :each do
        @library = Library.create!(name: "Round Hill Public Library")
        @book_1 = @library.books.create!(title: "Slaughterhouse-Five", genre: "Science Fiction")
        @book_2 = @library.books.create!(title: "The Secret History", genre: "Mystery")
        @author_1 = @book_1.authors.create!(name: "Kurt Vonnegut", birth_year: 1922)
        @author_2 = @book_1.authors.create!(name: "Kilgore Trout", birth_year: 1908)
        @author_3 = @book_2.authors.create!(name: "Donna Tartt", birth_year: 1963)
        visit "/books/#{@book_1.id}"
      end

      it 'i see the books name and genre' do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.genre)
        expect(page).not_to have_content(@book_2.title)
        expect(page).not_to have_content(@book_2.genre)
      end

      it 'and i see a list of authors it belongs to' do
        expect(page).to have_content(@author_1.name)
        expect(page).to have_content(@author_2.name)
        expect(page).not_to have_content(@author_3.name)
      end

      it 'and i see the name of the library it belongs to' do
        expect(page).to have_content("Library: #{@library.name}")
      end

      it 'i see the average age of the authors for that book' do
        expect(page).to have_content("Average Age of the Authors of #{@book_1.title}: 107")
      end
    end
  end
end
