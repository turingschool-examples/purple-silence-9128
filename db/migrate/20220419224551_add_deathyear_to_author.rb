class AddDeathyearToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :deathyear, :datetime
  end
end
