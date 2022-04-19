class CreateJoinTableBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      # t.index [:book_id, :author_id]
      # t.index [:author_id, :book_id]
      t.timestamps
      t.references :books, foreign_key: true
      t.references :authors, foreign_key: true
    end
  end
end
