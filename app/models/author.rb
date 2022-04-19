class Author < ApplicationRecord
  validates_presence_of :name, :birth_year
  
  has_many :authors_books
  has_many :books, through: :authors_books
  has_many :libraries, through: :books
end