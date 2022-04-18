class Author < ApplicationRecord
	has_many :author_books
	has_many :books, through: :author_books

	def self.author_average_age
		Time.now.year - average(:birth_year)
	end
end
