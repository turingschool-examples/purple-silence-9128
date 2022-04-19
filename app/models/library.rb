class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  def all_library_authors
    #binding.pry
  end

end
