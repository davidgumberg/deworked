class AddColumnsToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :edition_publication_year, :integer, limit: 3
    add_column :works, :edition_publication_month, :integer, limit: 1
    add_column :works, :edition_publication_day, :integer, limit: 1

    add_column :works, :original_publication_year, :integer, limit: 3
    add_column :works, :original_publication_month, :integer, limit: 1
    add_column :works, :original_publication_day, :integer, limit: 1
  end
end
