class Author < ApplicationRecord
  validates_presence_of :name, :birth_year
  validates_numericality_of :birth_year

  has_many :book_authors
  has_many :books, through: :book_authors
  has_many :libraries, through: :books

  def author_age
    2022 - birth_year
  end
end
