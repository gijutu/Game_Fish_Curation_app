class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game
  has_many :entries_games, through: :entries, source: :game

  has_many :comments, dependent: :destroy

  enum gender: {男性:1, 女性:2}

  mount_uploader :icon, ImageUploader
end
