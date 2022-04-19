class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :authors_books
  has_many :authors, through: :authors_books

  def average_author_age
    authors.map { |author| Date.current.year - author.birth_year }.sum() / authors.size
  end

end