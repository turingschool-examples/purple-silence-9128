class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :authors, through: :books

  def most_popular_authors
    authors.joins(:book_authors)
           .select('authors.*')
           .group('authors.id')
           .order('COUNT(book_authors.author_id = authors.id) DESC')
           .limit(3)
  end
end
