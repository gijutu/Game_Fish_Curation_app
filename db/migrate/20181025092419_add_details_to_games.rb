class AddDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :place, :string, limit: 500, default: "", null: false
    add_column :games, :price, :integer, limit: 4
    add_column :games, :remark, :text, limit: 500
    add_column :games, :note, :text, limit: 500
  end
end
