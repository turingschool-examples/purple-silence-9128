class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_age_of_author
    average_birth_year = authors.average(:birth_year)
    Time.now.year - average_birth_year
  end
end
