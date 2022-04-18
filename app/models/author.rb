class Author < ApplicationRecord
  validates_presence_of :name, :birth_year
  has_many :author_books
  has_many :books, through: :author_books

  def self.average_author_age
#    x = :birth_year
#    binding.pry
    Time.now.year - average(:birth_year)
  end

end
