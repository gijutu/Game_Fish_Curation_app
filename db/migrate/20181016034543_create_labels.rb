class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.integer :game_id
      t.string :game_lebel
      t.string :game_size
      t.string :game_event

      t.timestamps
    end
  end
end
