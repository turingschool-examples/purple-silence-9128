class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  
  def authors
    
    books.joins(:book_authors, :authors).distinct.order('authors.name').pluck(:name)
    # .select("authors.name as author_name")
  end

end