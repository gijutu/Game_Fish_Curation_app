class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  attr_accessor :text

end
