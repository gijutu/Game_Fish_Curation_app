class Area < ApplicationRecord
  has_many :open_area, dependent: :destroy
  belongs_to :game, optional: true
  belongs_to :user, optional: true
end
