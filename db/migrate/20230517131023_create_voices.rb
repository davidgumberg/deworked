class CreateVoices < ActiveRecord::Migration[7.0]
  def change
    create_table :voices do |t|
      t.references :author, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
