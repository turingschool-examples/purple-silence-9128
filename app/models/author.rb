class Author < ApplicationRecord
  validates_presence_of :name,
                        :birth_year
end
