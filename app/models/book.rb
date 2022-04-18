class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  # def author_names
  #   authors = Book.joins(:author_books, :authors).where(id: @book.id).first.authors
  #   authors.map { |author| author.name }
  # end

  def authors_average_age
    birth_years = authors.map { |author| author.birth_year }
    birth_years.map { |year| (2022 - year) / birth_years.count }[0]
  end
end
