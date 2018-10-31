class Labeling < ApplicationRecord
  validates :label_id, uniqueness: {scope: [:game_id]}
  belongs_to :game
  belongs_to :label
end
