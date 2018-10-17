class CreateOpenAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :open_areas do |t|
      t.integer :game_id
      t.integer :area_id

      t.timestamps
    end
  end
end
