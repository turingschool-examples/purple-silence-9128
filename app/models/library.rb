class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  def uniq_authors
    books.joins(:authors)
    .select("author.*")
    # .group("author.name")
    # @lib.books.joins(:authors).select("author.*").group("author.name")
  end
end