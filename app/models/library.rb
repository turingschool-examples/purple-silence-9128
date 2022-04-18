class Library < ApplicationRecord
  validates_presence_of :name
  has_many :books

  def find_authors
    books.map do |book|
      book.authors
    end.flatten.uniq
  end

  def popular_authors
    author_names = books.map do |book|
      book.authors.map do |author|
        author.name
      end
    end.flatten
    h = Hash.new(0)
    author_names.each do |name|
      if h[name] == 0
        h[name] = 1
      else
        h[name] += 1
      end
    end
    order = h.sort_by {|k,v| -v}
    top_3 = order.first(3)
    top_3.map do |pop|
      pop[0]
    end
  end
end
