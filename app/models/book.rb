class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def all_authors
    Author.joins(:books).where("books.id=#{self.id}")
  end

  def average_author_age
    Author.joins(:books).where("books.id=#{self.id}").average(:age)
  end
end
