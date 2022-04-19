class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def average_age_of_authors
    authors.average(:age)
  end
end
