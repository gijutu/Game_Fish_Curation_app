class Area < ApplicationRecord
  has_many :open_area, dependent: :destroy
  belongs_to :game
  belongs_to :user
end
