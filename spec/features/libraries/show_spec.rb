require 'rails_helper'


RSpec.describe 'library show page' do 
	it 'shows library name and has a link to library author index page' do 
		lib1 = Library.create!(name: 'Denver Public Library')
		lib2 = Library.create!(name: 'Littleton Public Library')
		book1 = lib1.books.create!(title: 'The Talisman', genre: 'Sci-fi')
		book2 = lib2.books.create!(title: 'Three Body Problem', genre: 'Sci-fi')
		book3 = lib1.books.create!(title: 'It', genre: 'Horror Fiction')
		author1 = Author.create!(name: 'Stephen King', birth_year: 1947)
		author2 = Author.create!(name: 'Peter Straub', birth_year: 1943)
		author3 = Author.create!(name: 'Cixin Liu', birth_year: 1963)
		author_book1 = AuthorBook.create!(author: author1, book: book1)
		author_book2 = AuthorBook.create!(author: author2, book: book1)
		author_book3 = AuthorBook.create!(author: author3, book: book2)
		author_book4 = AuthorBook.create!(author: author1, book: book3)

		visit "/libraries/#{lib1.id}"
		expect(page).to have_content(lib1.name)
		click_link 'View All Authors'
		expect(current_path).to eq("/libraries/#{lib1.id}/authors")

		expect(page).to have_content(author1.name, count:1)
		expect(page).to have_content(author2.name)
		expect(page).to_not have_content(author3.name)
	end

	it 'shows three most popular authors' do 
		lib1 = Library.create!(name: 'Denver Public Library')
		book1 = lib1.books.create!(title: 'The Talisman', genre: 'Sci-fi')
		book2 = lib1.books.create!(title: 'Three Body Problem 1', genre: 'Sci-fi')
		book2_2 = lib1.books.create!(title: 'Three Body Problem 2', genre: 'Sci-fi')
		book2_3 = lib1.books.create!(title: 'Three Body Problem 3', genre: 'Sci-fi')
		book3 = lib1.books.create!(title: 'It', genre: 'Horror Fiction')
		book4 = lib1.books.create!(title: 'Norwegian Wood', genre: 'Fiction')
		book4_2 = lib1.books.create!(title: '1Q84', genre: 'Fiction')
		book4_3 = lib1.books.create!(title: 'Killing Commendato', genre: 'Fiction' )
		author1 = Author.create!(name: 'Stephen King', birth_year: 1947)
		author2 = Author.create!(name: 'Peter Straub', birth_year: 1943)
		author3 = Author.create!(name: 'Cixin Liu', birth_year: 1963)
		author4 = Author.create!(name: 'Haruki Murakami', birth_year: 1949)
		author_book1 = AuthorBook.create!(author: author1, book: book1)
		author_book2 = AuthorBook.create!(author: author2, book: book1)
		author_book3 = AuthorBook.create!(author: author3, book: book2)
		author_book3_1 = AuthorBook.create!(author: author3, book: book2_2)
		author_book3_2 = AuthorBook.create!(author: author3, book: book2_3)
		author_book4 = AuthorBook.create!(author: author1, book: book3)
		author_book5 = AuthorBook.create!(author: author4, book: book4)
		author_book5 = AuthorBook.create!(author: author4, book: book4_2)
		author_book5 = AuthorBook.create!(author: author4, book: book4_3)

		visit "/libraries/#{lib1.id}"
		
		expect(page).to have_content(author3.name)
		expect(page).to have_content(author4.name)
		expect(page).to have_content(author1.name)
		expect(page).to_not have_content(author2.name)
	end

end