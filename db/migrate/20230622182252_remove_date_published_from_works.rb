class RemoveDatePublishedFromWorks < ActiveRecord::Migration[7.0]
  def change
    remove_column :works, :date_published, :datetime
  end
end
