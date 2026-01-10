class BeveragesController < ApplicationController
  before_action :set_beverage, only: %i[show edit update destroy]

  def index
    @beverages = Beverage.order(:name)
  end

  def show
  end

  def new
    @beverage = Beverage.new
  end

  def create
    @beverage = Beverage.new(beverage_params)

    if @beverage.save
      redirect_to beverages_path, notice: "飲み物を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @beverage.update(beverage_params)
      redirect_to beverages_path, notice: "飲み物を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @beverage.destroy
      redirect_to beverages_path, notice: "飲み物を削除しました。"
    else
      redirect_to beverages_path, alert: "この飲み物は摂取記録があるため削除できません。"
    end
  end

  private

  def set_beverage
    @beverage = Beverage.find(params[:id])
  end

  def beverage_params
    params.require(:beverage).permit(:name, :caffeine_mg)
  end
end
