require 'rails_helper'

RSpec.describe 'Libraries Show' do
  it 'displays the Libraries name' do
    lib_1 = Library.create!(name: 'Library of Book Learnin')

    visit "/libraries/#{lib_1.id}"

    expect(page).to have_content("Library of Book Learnin")
  end
end
