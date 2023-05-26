class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :ISBN
      t.datetime :date_published

      t.timestamps
    end
  end
end
