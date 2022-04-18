# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
dpl = Library.create!(name: "Denver Public Library")
lotr = Book.create!(title: "The Lord of the Rings", genre: "Fantasy", library_id: dpl.id)
falling_up = Book.create!(title: "Falling Upward", genre: "Spiritual", library_id: dpl.id)
herbology = Book.create!(title: "A Guide to Herbology", genre: "Nonfiction", library_id: dpl.id)
tolkein = Author.create!(name: "JRR Tolkein", birth_year: 1892)
rohr = Author.create!(name: "Richard Rohr", birth_year: 1943)
henderson = Author.create!(name: "Dee Henderson", birth_year: 1959)
goshawk = Author.create!(name: "Gerald Goshawk", birth_year: 1948)
author_book_lotr = AuthorBook.create!(book_id: lotr.id, author_id: tolkein.id)
author_book_falling_up = AuthorBook.create!(book_id: falling_up.id, author_id: rohr.id)
author_book_herbology = AuthorBook.create!(book_id: herbology.id, author_id: henderson.id)
author_book_herbology = AuthorBook.create!(book_id: herbology.id, author_id: goshawk.id)
