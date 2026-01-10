class Beverage < ApplicationRecord
  has_many :caffeine_intakes, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :caffeine_mg, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # セレクトボックス用の表示名
  def name_with_caffeine
    "#{name}（#{caffeine_mg}mg）"
  end
end
