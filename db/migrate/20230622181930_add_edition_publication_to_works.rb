class AddEditionPublicationToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :edition_publication, :date
  end
end
