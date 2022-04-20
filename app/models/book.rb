class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_age 
    Time.now.year - authors.average(:birth_year).to_i
  end

end