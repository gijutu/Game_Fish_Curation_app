class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false, default: "", limit: 500
      t.text :content, null: false, default: "", limit: 10000
      t.integer :user_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.date :the_day, null: false
      t.timestamps
    end
  end
end
