class CaffeineIntakesController < ApplicationController
  before_action :set_caffeine_intake, only: %i[show edit update destroy]

  def index
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.current
    @caffeine_intakes = CaffeineIntake.on_date(@date).includes(:beverage).recent
    @daily_total = @caffeine_intakes.sum(&:total_caffeine_mg)
  end

  def show
  end

  def new
    @caffeine_intake = CaffeineIntake.new(consumed_at: Time.current.change(sec: 0))
    @beverages = Beverage.order(:name)
  end

  def create
    @caffeine_intake = CaffeineIntake.new(caffeine_intake_params)

    if @caffeine_intake.save
      redirect_to root_path, notice: "カフェイン摂取を記録しました。"
    else
      @beverages = Beverage.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @beverages = Beverage.order(:name)
  end

  def update
    if @caffeine_intake.update(caffeine_intake_params)
      redirect_to caffeine_intakes_path, notice: "記録を更新しました。"
    else
      @beverages = Beverage.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @caffeine_intake.destroy
    redirect_to caffeine_intakes_path, notice: "記録を削除しました。"
  end

  private

  def set_caffeine_intake
    @caffeine_intake = CaffeineIntake.find(params[:id])
  end

  def caffeine_intake_params
    params.require(:caffeine_intake).permit(:beverage_id, :consumed_at, :quantity)
  end
end
