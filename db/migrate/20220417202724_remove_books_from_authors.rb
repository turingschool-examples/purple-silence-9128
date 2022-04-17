class RemoveBooksFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :authors, :book, foreign_key: true
  end
end
