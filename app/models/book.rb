class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def all_authors
    #binding.pry
    Author.joins(:books).where("books.id=#{self.id}")
  end
end
