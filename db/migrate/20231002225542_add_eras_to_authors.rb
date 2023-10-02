class AddErasToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :birth_era, :integer, default: 1
    add_column :authors, :death_era, :integer, default: 1
  end
end
