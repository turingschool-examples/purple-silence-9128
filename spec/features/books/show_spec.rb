require 'rails_helper'

RSpec.describe 'Book Show Page' do
    
    describe 'as a visitor' do

        it 'Has the books attributes, authors, and library its at' do
            lib = Library.create!(name: 'The Library')
            king = Author.create!(name: 'stephen king', age: 77)
            bach = Author.create!(name: 'richard bachman', age: 55)
            # dark = Book.create!(title: 'Dark Tower', genre: 'fantasy', library_id: lib.id, author_id: king.id, bach.id)
            



        end




    end 
end