class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :author_books, through: :books
  has_many :authors, through: :author_books


  def three_most_popular_authors
    authors.joins(:books)
           .select('authors.*, count(books) as all_books')
           .group('authors.id')
           .order(all_books: :desc)
           .limit(3)
  end
end
