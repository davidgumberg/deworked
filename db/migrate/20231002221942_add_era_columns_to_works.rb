class AddEraColumnsToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :original_publication_era, :integer, default: 1
    add_column :works, :edition_publication_era, :integer, default: 1
  end
end
