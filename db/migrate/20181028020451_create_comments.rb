class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :game, foreign_key: true
      t.text :content
      t.integer :user_id
      t.references :user

      t.timestamps
    end
  end
end
