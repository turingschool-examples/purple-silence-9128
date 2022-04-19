require 'rails_helper'

RSpec.describe "Libraries #show" do

  before :each do
    @library1 = Library.create!(name: "Chicago Library")
  end

  it "shows a name and a link to the library's authors show page" do
    visit "/libraries/#{@library1.id}"
    expect(page).to have_content(@library1.name)
    expect(page).to have_link(href: "/libraries/#{library1.id}/authors/")
  end
end
