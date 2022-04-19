class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :author_books, through: :books
  has_many :authors, through: :author_books

  def top_3_authors
    authors.joins(books: :library)
           .select("authors.*, count(books.*)")
           .where("books.library_id = libraries.id")
           .group(:id)
           .order(count: :desc)
           .limit(3)
  end
end
