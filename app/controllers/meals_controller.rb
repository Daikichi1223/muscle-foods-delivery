class MealsController < ApplicationController
  def index
    @meals = Meal.all.order("created_at DESC")
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create(meal_params)
    if @meal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def meal_params
    params.require(:meal).permit(:name, :explanation, :genre_id, :protein, :fat, :carbo, :price, :image).merge(shop_id: current_shop.id)
  end
end