class RemoveLastNameFromAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :last_name, :string
  end
end
