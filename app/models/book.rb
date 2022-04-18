class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :book_authors
  has_many :authors, through: :book_authors
end
