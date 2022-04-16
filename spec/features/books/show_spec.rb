require 'rails_helper'

RSpec.describe 'books show page' do
 before(:each) do
   @library1 = Library.create!("Ferretpedia")
   @library2 = Library.create!("High Plains")

   @book1 = @library1.books.create!(title: "Book of END", genre: "Shounen")
   @book2 = @library1.books.create!(title: "Noland the Liar", genre: "Fantasy")

   @author1 = Author.create!(name: "Pabu", birth_year: 2019)
   @author1 = Author.create!(name: "Zeref", birth_year: 1840)

   @ba1 = BookAuthors.create!(book_id: @book1.id, author_id: @author1.id)
   @ba2 = BookAuthors.create!(book_id: @book1.id, author_id: @author2.id)
   @ba3 = BookAuthors.create!(book_id: @book2.id, author_id: @author1.id)

   visit book_path(@book1)
 end
 describe 'User story 1' do
   it 'has books attriibutes' do
     within("#book") do
       expect(page).to have_content(@book1.name)
       expect(page).to have_content(@book1.genre)
       expect(page).to_not have_content(@book2.name)
       expect(page).to_not have_content(@book2.genre)
     end
   end
   xit 'shows authors' do
     within("#book-author-#{@author1.id}") do
       expect(page).to have_content(@author1.name)
     end
     within("#book-author-#{@author2.id}") do
       expect(page).to have_content(@author2.name)
     end
   end
   xit 'has libraries name' do
     within("#book-library") do
       expect(page).to have_content(@library1.name)
       expect(page).to_not have_content(@library2.name)
     end
   end
 end

 describe 'User story 2' do
   it 'shows average age of authors' do
     within("#average_age") do

     end
   end
 end
end
