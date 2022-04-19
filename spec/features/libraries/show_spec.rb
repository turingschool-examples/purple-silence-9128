# Story 3 of 3
# As a visitor
# When I visit a Library's show page
# I see the name of that library
# and i see a link to view all of the authors that have written books that the library has
# When I click on that link
# I am taken to a Library's authors index page
# and I can see a unique list of names of all the authors that this library has
require 'rails_helper'

RSpec.describe 'a library show page' do
  before :each do
    @library_1 = Library.create!(name: 'Denver Public Library')
    @library_2 = Library.create!(name: 'Aurora Public Library')

    visit "/libraries/#{@library_1.id}"
  end

  context 'user story 3' do
    it 'has the name of the library' do
      expect(page).to have_content('Denver Public Library')
      expect(page).to_not have_content('Aurora Public Library')
    end

    it 'has a link to the library authors index' do
      click_link "View all authors at Denver Public Library"

      expect(current_path).to eq("/libraries/#{@library_1.id}/authors")
    end
  end
end
