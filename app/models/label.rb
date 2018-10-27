class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  belongs_to :game

  attr_accessor :text

  def self.setForm
    @labels = [Label.new, Label.new, Label.new, Label.new,Label.new, Label.new, Label.new, Label.new, Label.new ]
    @labels.each_with_index do |label, i|
      case i
      when 0 then
        label.text = 'エンジョイ'
      when 1 then
        label.text = 'オープン'
      when 2 then
        label.text = 'ガチ'
      when 3 then
        label.text = 'メーカールアー限定'
      when 4 then
        label.text = '小規模：２０人未満程度'
      when 5 then
        label.text = '中規模：２０〜５０人程度'
      when 6 then
        label.text = '大規模：５０人以上'
      when 7 then
        label.text = 'おかっぱり'
      when 8 then
        label.text = 'ボート'
      end
    end
    return @labels
  end
end
