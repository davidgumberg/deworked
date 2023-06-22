class AddOriginalPublicationToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :original_publication, :date
  end
end
