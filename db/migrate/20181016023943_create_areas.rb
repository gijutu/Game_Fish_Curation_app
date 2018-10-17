class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :area, null: false
      t.references :game, index: true

      t.timestamps
    end
  end
end
