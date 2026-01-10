class DashboardController < ApplicationController
  def index
    @today = Date.current
    @today_intakes = CaffeineIntake.on_date(@today).includes(:beverage).recent
    @today_total = @today_intakes.sum(&:total_caffeine_mg)
    @beverages = Beverage.order(:name).limit(5)
  end
end
