class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_age_of_authors
    authors.pluck('SUM(2022 - authors.birth_year) AS age').first / authors.count
  end
end
