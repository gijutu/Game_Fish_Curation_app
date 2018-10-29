class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  belongs_to :game

  attr_accessor :text

end
