class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :birth_year

  # has_many :invoice_items
  # has_many :items, through: :invoice_items

  has_many :book_authors
  has_many :books, through: :book_authors

  def age
    DateTime.now.year - birth_year.year
  end
end
