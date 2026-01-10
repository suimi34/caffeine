# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# 飲み物マスターデータ
beverages = [
  { name: "コーヒー（ドリップ）", caffeine_mg: 95 },
  { name: "エスプレッソ", caffeine_mg: 63 },
  { name: "カフェラテ", caffeine_mg: 75 },
  { name: "インスタントコーヒー", caffeine_mg: 60 },
  { name: "緑茶", caffeine_mg: 30 },
  { name: "紅茶", caffeine_mg: 47 },
  { name: "ほうじ茶", caffeine_mg: 20 },
  { name: "烏龍茶", caffeine_mg: 20 },
  { name: "コーラ", caffeine_mg: 34 },
  { name: "ペプシ", caffeine_mg: 38 },
  { name: "レッドブル", caffeine_mg: 80 },
  { name: "モンスターエナジー", caffeine_mg: 142 },
  { name: "抹茶", caffeine_mg: 70 },
  { name: "ココア", caffeine_mg: 5 },
  { name: "ダークチョコレート（50g）", caffeine_mg: 40 }
]

puts "飲み物マスターデータを作成中..."

beverages.each do |beverage_data|
  Beverage.find_or_create_by!(name: beverage_data[:name]) do |beverage|
    beverage.caffeine_mg = beverage_data[:caffeine_mg]
  end
end

puts "完了: #{Beverage.count} 件の飲み物を登録しました"
