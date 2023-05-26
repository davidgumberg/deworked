class AddStyleToVoice < ActiveRecord::Migration[7.0]
  def change
    add_column :voices, :style, :integer
  end
end
