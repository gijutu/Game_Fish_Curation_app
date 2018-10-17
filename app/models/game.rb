class Game < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :entries, dependent: :destroy
  has_many :entry_users, through: :entries, source: :user

  has_many :labels
  has_many :labelings, dependent: :destroy
  has_many :labeling_labels, through: :labelings, source: :label

  has_many :areas
  has_many :open_areas, dependent: :destroy
  has_many :open_area_areas, through: :open_areas, source: :area

  def self.search(search)
    if search.present?
      Game.where('title LIKE ?', "%#{search}%")
    else
      Game.all
    end
  end
end
