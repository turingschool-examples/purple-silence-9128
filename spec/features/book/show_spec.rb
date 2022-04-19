require "rails_helper"

RSpec.describe "Book show page" do
  let!(:dpl) { Library.create!(name: "Denver Public Library") }

  let!(:tolkein) { Author.create!(name: "JRR Tolkein", birth_year: 1892) }
  let!(:lotr) { Book.create!(title: "The Lord of the Rings", genre: "Fantasy", library_id: dpl.id) }
  let!(:author_book_lotr) { AuthorBook.create!(book_id: lotr.id, author_id: tolkein.id) }

  let!(:rohr) { Author.create!(name: "Richard Rohr", birth_year: 1943) }
  let!(:falling_up) { Book.create!(title: "Falling Upward", genre: "Spiritual", library_id: dpl.id) }
  let!(:author_book_falling_up) { AuthorBook.create!(book_id: falling_up.id, author_id: rohr.id) }

  let!(:henderson) { Author.create!(name: "Dee Henderson", birth_year: 1959) }
  let!(:goshawk) { Author.create!(name: "Gerald Goshawk", birth_year: 1947) }
  let!(:herbology) { Book.create!(title: "A Guide to Herbology", genre: "Nonfiction", library_id: dpl.id) }
  let!(:author_book_herbology_henderson) { AuthorBook.create!(book_id: herbology.id, author_id: henderson.id) }
  let!(:author_book_herbology_goshawk) { AuthorBook.create!(book_id: herbology.id, author_id: goshawk.id) }

  before :each do
    visit "/books/#{herbology.id}"
  end

  it "lists all info for book" do
    expect(page).to have_content("A Guide to Herbology")
    expect(page).to_not have_content("Falling Upward")
    expect(page).to have_content("Nonfiction")
    expect(page).to_not have_content("Fantasy")
    expect(page).to have_content("Dee Henderson")
    expect(page).to have_content("Gerald Goshawk")
    expect(page).to_not have_content("JRR Tolkein")
    expect(page).to have_content("Denver Public Library")
  end

  it "lists authors average age" do
    expect(page).to have_content("69")
  end
end
