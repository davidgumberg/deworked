class RemoveColumnsFromWorks < ActiveRecord::Migration[7.0]
  def change
    remove_column :works, :edition_publication, :date
    remove_column :works, :original_publication, :date
  end
end
