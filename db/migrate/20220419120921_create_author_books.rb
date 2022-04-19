class CreateAuthorBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :author_books do |t|
      t.references :books, foreign_key: true
      t.references :authors, foreign_key: true
    end
  end
end
