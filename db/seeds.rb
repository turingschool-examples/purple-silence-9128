# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
library = Library.create!(name: "Big Ass Library")
small_library = Library.create!(name: "Small Ass Library")

book_1 = library.books.create!(title: "Put This Book Down and Do Your IC", genre: "Nonfiction")
book_2 = library.books.create!(title: "For God's Sake Don't Read This", genre: "Fiction")
book_3 = library.books.create!(title: "This Book is Sooo Good", genre: "Nonfiction")
book_4 = library.books.create!(title: "Hello your FUTURE'S ON THE LINE", genre: "Fiction")

thiccums = Author.create!(name: "H.T. Thiccums", birth_year: 1904)
hiccups = Author.create!(name: "J.R. Hiccups", birth_year: 2017)
bad_author = Author.create!(name: "I.Am. Terrible", birth_year: 1847)
strange_author = Author.create!(name: "Wiggles McDoofus", birth_year: 1975)

ab_1 = AuthorBook.create!(author_id: thiccums.id, book_id: book_1.id)
ab_2 = AuthorBoork.create!(author_id: hiccups.id, book_id: book_1.id)
ab_3 = AuthorBook.create!(author_id: bad_author.id, book_id: book_2.id)
ab_4 = AuthorBook.create!(author_id: strange_author.id, book_id: book_2.id)
ab_5 = AuthorBook.create!(author_id: thiccums.id, book_id: book_3.id)
ab_6 = AuthorBook.create!(author_id: hiccups.id, book_id: book_4.id)
ab_7 = AuthorBook.create!(author_id: bad_author.id, book_id: book_4.id)
