# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@library = Library.create!(name: "DPLibrary")
@book = @library.books.create!(title: "There and Back Again", genre: 'Fantasy')
@author = @book.authors.create!(name: "JRR Tolkein", birth_year: 1892)
@book.author_books.create!(book_id: @book.id, author_id: @author.id)
