require "rails_helper"

RSpec.describe "Library show page" do
  let!(:dpl) { Library.create!(name: "Denver Public Library") }

  before :each do
    visit "/libraries/#{dpl.id}"
  end

  it "has link to library authors index page" do
    expect(page).to have_link("View All Authors")
    click_link "View All Authors"
    expect(current_path).to eq("/libraries/#{dpl.id}/authors")
  end
end
