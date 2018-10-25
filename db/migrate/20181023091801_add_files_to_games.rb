class AddFilesToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :file, :string
  end
end
