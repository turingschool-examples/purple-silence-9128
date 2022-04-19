class AuthorBook < ApplicationRecord
  has_many :books
  has_many :authors
end
