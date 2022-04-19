class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  def self.average_age
    Time.now.year - average(:birth_year)
  end
end
