class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  def all_authors
    books.flat_map { |book| book.authors }
  end
end
