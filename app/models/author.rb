class Author < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true


  has_many :book_authors
  has_many :books, through: :book_authors
end
