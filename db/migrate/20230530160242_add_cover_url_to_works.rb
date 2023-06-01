class AddCoverUrlToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :cover_url, :string
  end
end
