class Author < ApplicationRecord
  validates_presence_of :title, :genre
  has_many :author_books
  has_many :books, through: :author_books
end
