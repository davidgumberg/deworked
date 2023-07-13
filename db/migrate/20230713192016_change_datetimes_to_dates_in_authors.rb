class ChangeDatetimesToDatesInAuthors < ActiveRecord::Migration[7.0]
  def up
    change_table :authors do |t|
      t.change :birth, :date
      t.change :death, :date
    end
  end
  def down
    change_table :authors do |t|
      t.change :birth, :datetime
      t.change :death, :datetime
    end
  end
end
