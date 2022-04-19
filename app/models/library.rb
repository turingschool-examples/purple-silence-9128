class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :author_books, through: :books
  has_many :authors, through: :author_books
end
