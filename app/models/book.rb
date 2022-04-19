class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def authors_average_age
    Time.now.year - authors.average(:birth_year)
  end
end
