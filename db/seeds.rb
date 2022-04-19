# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
library = Library.create!(name: "Denver Public Library")

autho_1 = Author.create!(name: "Jon Krakauer", birth_year: 1975)
author_2 = Author.create!(name: "Barbara Oakley, Ph.D.", birth_year: 1982)

book_1 = library.books.create!(title: "Into the Wild", genre: "Non-Fiction")
book_2 = library.books.create!(title: "a Mind for Numbers", genre: "Non-Fiction")

ab_1 = AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
ab_2 = AuthorBook.create!(author_id: @author_2.id, book_id: @book_2.id)
