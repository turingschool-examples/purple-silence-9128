class Author < ApplicationRecord
  validates_presence_of :name, :age
  has_many :author_books
  has_many :books, through: :author_books
end
