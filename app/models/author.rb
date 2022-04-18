class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  def self.avg_age
    average('2022 - birth_year')
  end

  def self.three_most_popular
    joins(:books).select('authors.*, sum(books.id) as num').group('authors.id').order('num desc').limit(3)
  end
end
