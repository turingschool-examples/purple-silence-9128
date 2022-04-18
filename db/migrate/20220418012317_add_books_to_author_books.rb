class AddBooksToAuthorBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :author_books, :book, foreign_key: true
  end
end
