class CaffeineIntake < ApplicationRecord
  belongs_to :beverage

  validates :consumed_at, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # 合計カフェイン量を計算
  def total_caffeine_mg
    beverage.caffeine_mg * quantity
  end

  # 日付でグループ化するためのスコープ
  scope :on_date, ->(date) { where(consumed_at: date.all_day) }
  scope :recent, -> { order(consumed_at: :desc) }
end
