class Book < ApplicationRecord
  validates_presence_of :title, :genre

  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def avg_authors_age
    avg = Time.now.year - (authors.sum(:birth_year).to_f / 2.0)
    avg.round(1)
  end
end
