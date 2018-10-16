class Area < ApplicationRecord
  has_many :open_area, dependent: :destroy
  belongs_to :game
end
