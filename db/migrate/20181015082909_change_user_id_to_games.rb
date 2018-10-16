class ChangeUserIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :games, :users
  end
end
