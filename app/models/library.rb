class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  def find_authors
    books.map do |book|
      book.authors
    end.flatten.uniq
  end
end
