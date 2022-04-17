class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :authors, through: :books

  def unique_author_names
    authors.distinct.pluck(:name)
  end

  def top_3_authors
    authors.joins(:books)
            .select("authors.name, count(books) as book_count")
            .group("authors.name")
            .order(book_count: :desc)
            .limit(3)
  end
end