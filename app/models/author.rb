class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  def self.average_age
    # Author.average(:birth_year)
  x = Author.all.map do |author|
      Date.today.year - author.birth_year
    end
  x.sum / x.size
  end

  def self.list_of_authors
    Author.order(:name).distinct
  end
end
