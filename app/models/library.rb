class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :authors, through: :books
  has_many :book_authors, through: :books

  def most_popular_authors
    authors.joins(:books)
    .select("authors.*, count(books) as count")
    .group("authors.id")
    .order(count: :desc)
    .limit(3)
  end

end
