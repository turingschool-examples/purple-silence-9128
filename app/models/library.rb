class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :book_authors, through: :books
  has_many :authors, through: :book_authors
end
