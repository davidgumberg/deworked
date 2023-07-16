class AddColumnsToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :birth_year, :integer, limit: 3
    add_column :authors, :birth_month, :integer, limit: 1
    add_column :authors, :birth_day, :integer, limit: 1

    add_column :authors, :death_year, :integer, limit: 3
    add_column :authors, :death_month, :integer, limit: 1
    add_column :authors, :death_day, :integer, limit: 1
  end
end
