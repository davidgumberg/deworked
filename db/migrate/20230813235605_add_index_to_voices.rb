class AddIndexToVoices < ActiveRecord::Migration[7.0]
  def change
    add_index :voices, [:author_id, :work_id, :style], unique: true
  end
end
