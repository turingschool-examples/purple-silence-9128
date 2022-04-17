class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books
  has_many :authors, through: :books

  def unique_author_names
    authors.distinct
  end
end