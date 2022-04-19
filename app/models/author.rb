class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  has_many :libraries, through: :books


  def self.authors_average_age
    Time.now.year - Author.average(:birth_year).round
  end
end