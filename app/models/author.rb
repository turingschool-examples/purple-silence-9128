class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  has_many :libraries, through: :books

  validates_presence_of :name, :age
end
