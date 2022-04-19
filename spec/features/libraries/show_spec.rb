require 'rails_helper'

RSpec.describe 'Library show page' do
 before(:each) do
   @library1 = Library.create!(name: "Ferretpedia")
   @library2 = Library.create!(name: "High Plains")

   @book1 = @library1.books.create!(title: "Book of END", genre: "Shounen")
   @book2 = @library1.books.create!(title: "Noland the Liar", genre: "Fantasy")
   @book3 = @library2.books.create!(title: "Harry Potter", genre: "Fantasy")

   @author1 = Author.create!(name: "Pabu", birth_year: 2019)
   @author2 = Author.create!(name: "Zeref", birth_year: 1840)
   @author3 = Author.create!(name: "JK R.", birth_year: 1840)

   @ba1 = BookAuthor.create!(book_id: @book1.id, author_id: @author1.id)
   @ba2 = BookAuthor.create!(book_id: @book1.id, author_id: @author2.id)
   @ba3 = BookAuthor.create!(book_id: @book2.id, author_id: @author1.id)
   @ba4 = BookAuthor.create!(book_id: @book3.id, author_id: @author3.id)

   visit "/library/#{@library1.id}"
 end

 describe 'User story 3' do
   it 'has links to authors' do
     expect(page).to have_content(@library1.name)
     within("#library") do
       click_link "View all authors"

       expect(current_path).to eq("/library/#{@library1.id}/authors")
     end
     within("#authors") do
       expect(page).to have_content("#{@author1.name}")
       expect(page).to have_content(@author2.name)
       expect(page).to_not have_content(@author3.name)
     end
   end
 end
end
