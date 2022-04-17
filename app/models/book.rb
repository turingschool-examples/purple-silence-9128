class Book < ApplicationRecord
  validates_presence_of :title, :genre
  belongs_to :library
  has_many :authors
end