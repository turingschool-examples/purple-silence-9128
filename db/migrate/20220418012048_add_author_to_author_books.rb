class AddAuthorToAuthorBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :author_books, :author, foreign_key: true
  end
end
