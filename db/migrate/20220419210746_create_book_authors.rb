class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.references :books, foreign_key: true
      t.references :authors, foreign_key: true
    end
  end
end
