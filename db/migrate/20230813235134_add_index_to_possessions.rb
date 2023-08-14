class AddIndexToPossessions < ActiveRecord::Migration[7.0]
  def change
    add_index :possessions, [:user_id, :work_id], unique: true
  end
end
