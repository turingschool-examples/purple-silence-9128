class ChangeBirthYearToBeIntegerInAuthors < ActiveRecord::Migration[5.2]
  change_table :authors do |table|
    table.change :birth_year, :integer
  end
end
