class DropDatesFromAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :birth
    remove_column :authors, :death
  end
end

