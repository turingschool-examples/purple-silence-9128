class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :author_books, through: :books
  has_many :authors, through: :author_books

  def three_most_popular_authors
    authors.joins(:books)
    .select("authors.*, count(books) as book_count")
    .group(:id)
    .order("book_count desc")
    .limit(3)
  end
end
