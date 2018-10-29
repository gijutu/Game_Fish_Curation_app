class Comment < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :content, presence: true
end
