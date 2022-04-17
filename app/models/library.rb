class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  
  def authors
    
    books.joins(:book_authors, :authors).distinct.order('authors.name').pluck(:name)
   
  end

end