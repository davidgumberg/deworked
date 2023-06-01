class FixAuthorName < ActiveRecord::Migration[7.0]
  def up
    rename_column :authors, :first_name, :name
  end

  def down
    rename_column :authors, :name, :first_name
  end
end
