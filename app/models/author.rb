class Author < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :deathyear, presence: true


  has_many :book_authors
  has_many :books, through: :book_authors

  def age
    deathyear.year - dob.year
  end
end
