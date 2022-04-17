class RemoveAuthorsFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :books, :author, foreign_key: true
  end
end
