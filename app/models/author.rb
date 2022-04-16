class Author < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :age

  # has_many :invoice_items
  # has_many :items, through: :invoice_items

  has_many :book_authors
  has_many :books, through: :book_authors
end
