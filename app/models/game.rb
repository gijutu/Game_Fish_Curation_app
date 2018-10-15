class Game < ApplicationRecord
  def self.search(search)
    if search.present?
      Game.where(title: search)
    else
      Game.all
    end
  end
end
