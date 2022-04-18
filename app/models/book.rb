class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books

  def average_author_age
    (Time.now.year - authors.average(:birth_year)).to_f
  end

  def self.author_names_by_library(library_id)
    joins(:authors).where('library_id' => library_id).distinct.pluck(:name)
  end
end
