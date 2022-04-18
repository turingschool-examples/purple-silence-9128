require 'rails_helper'


RSpec.describe 'books show page' do 
	it 'shows book attributes, list of authors, and the library' do 
		lib1 = Library.create!(name: 'Denver Public Library')
		lib2 = Library.create!(name: 'Littleton Public Library')
		book1 = lib1.books.create!(title: 'The Talisman', genre: 'Sci-fi')
		book2 = lib2.books.create!(title: 'Three Body Problem', genre: 'Sci-fi')
		author1 = Author.create!(name: 'Stephen King', birth_year: 1947)
		author2 = Author.create!(name: 'Peter Straub', birth_year: 1943)
		author3 = Author.create!(name: 'Cixin Liu', birth_year: 1963)
		author_book1 = AuthorBook.create!(author: author1, book: book1)
		author_book2 = AuthorBook.create!(author: author2, book: book1)
		author_book3 = AuthorBook.create!(author: author3, book: book2)

		visit "/libraries/#{lib1.id}/books/#{book1.id}"

		expect(page).to have_content(book1.title)
		expect(page).to have_content(book1.genre)
		expect(page).to have_content(author1.name)
		expect(page).to have_content(author2.name)
		expect(page).to have_content(lib1.name)

		expect(page).to_not have_content(lib2.name)
		expect(page).to_not have_content(author3.name)
	end

	it 'shows the average age of authors for a book' do 
		lib1 = Library.create!(name: 'Denver Public Library')
		book1 = lib1.books.create!(title: 'The Talisman', genre: 'Sci-fi')
		author1 = Author.create!(name: 'Stephen King', birth_year: 1947)
		author2 = Author.create!(name: 'Peter Straub', birth_year: 1943)
		author_book1 = AuthorBook.create!(author: author1, book: book1)
		author_book2 = AuthorBook.create!(author: author2, book: book1)

		visit "/libraries/#{lib1.id}/books/#{book1.id}"

		expect(page).to have_content(77)
	end

end