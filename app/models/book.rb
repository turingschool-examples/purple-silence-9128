class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :author_books
  has_many :authors, through: :author_books


  def authors_name
    # require "pry"; binding.pry
    authors.pluck(:name)
  end

  def average_author_age
    Time.now.year - authors.average(:birthyear)
  end



end
