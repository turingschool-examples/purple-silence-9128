class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  has_many :authors, through: :books

  def unique_author_list
    author_list = authors.select(:name).distinct
    author_list.map {|author| author.name}
  end

  # def most_popular_authors
  # end
end
