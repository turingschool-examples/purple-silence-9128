class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_age_of_authors
    authors.pluck('SUM(2022 - authors.birth_year)').first / authors.count

    # authors.average('SUM(2022 - authors.birth_year)')

    # authors.select('AVG(age)')
    #        .from(authors.select('authors.*, SUM(2022 - authors.birth_year) AS age')
    #                     .group('authors.id')
    #                   )

    # authors.average('age')
    #        .from(authors.select('authors.*, SUM(2022 - authors.birth_year) AS age')
    #                     .group('authors.id')
    #                   )
  end
end
