require 'rails_helper'

describe 'book show page' do
  before do
    @lib_1 = Library.create!(name: "Delware")
    @book_3 = @lib_1.books.create!(
      title: "Mind for Numbers",
      genre: "NonFiction"
    )
    @book_9 = @lib_1.books.create!(
      title: "Learning to Learn",
      genre: "NonFiction"
    )

    @lib_2 = Library.create!(name: "Greenie")
    @book_5 = @lib_2.books.create!(
      title: "Fizban's Treasury of Dragons",
      genre: "Fantasy"
    )
    @book_7 = @lib_2.books.create!(
      title: "Dungeon Master's Guide",
      genre: "Fantasy"
    )
    @book_1 = @lib_2.books.create!(
      title: "Ender's Game",
      genre: "Science Fiction"
    )


    @author_2 = Author.create!(
      name: "Carmen",
      dob: DateTime.new(1953),
      deathyear: DateTime.new(2018)
    )
    @book_author_3 = BookAuthor.create!(
      book_id: @book_3.id,
      author_id: @author_2.id,
    )
    @book_author_4 = BookAuthor.create!(
      book_id: @book_9.id,
      author_id: @author_2.id,
    )
    @book_author_5 = BookAuthor.create!(
      book_id: @book_1.id,
      author_id: @author_2.id,
    )

    @author_1 = Author.create!(
      name: "Fizban",
      dob: DateTime.new(1003),
      deathyear: DateTime.new(2022)
    )
    @book_author_1 = BookAuthor.create!(
      book_id: @book_5.id,
      author_id: @author_1.id,
    )
    @book_author_2 = BookAuthor.create!(
      book_id: @book_7.id,
      author_id: @author_1.id,
    )

    @author_3 = Author.create!(
      name: "Earl",
      dob: DateTime.new(1949),
      deathyear: DateTime.new(2007)
    )
    @book_author_1 = BookAuthor.create!(
      book_id: @book_1.id,
      author_id: @author_3.id,
    )

    visit book_path(@book_5)
  end

  describe 'display' do
    it 'shows the books title and genre' do
      expect(page).to have_content("Fizban's Treasury of Dragons")
      expect(page).to have_content("Fantasy")

      expect(page).not_to have_content("Mind for Numbers")
      expect(page).not_to have_content("NonFiction")
    end

    it 'shows list of authors for book' do
      visit book_path(@book_1)
      within "#authors" do
      expect(page).to have_content(@author_2.name)
      expect(page).to have_content(@author_3.name)

      expect(page).to_not have_content(@author_1.name)
      end
    end

    it 'shows the name of the library the book belongs to' do
      within "#library" do
        expect(page).to have_content("Avaliable at: Greenie Library")

        expect(page).not_to have_content("Avaliable at: Delware Library")
      end
    end

    it 'shows the books authors average ages' do
      visit book_path(@book_1)
      expect(page).to have_content("Average Author Age: 61")

      expect(page).not_to have_content("Average Author Age: 1019")
      expect(page).not_to have_content("Average Author Age: 65")
    end
  end
end