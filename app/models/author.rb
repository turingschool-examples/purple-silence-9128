class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  def self.avg_age
    average('2022 - birth_year')
  end
end
