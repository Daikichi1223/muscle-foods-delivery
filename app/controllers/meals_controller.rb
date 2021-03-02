class MealsController < ApplicationController
  def index
    @meals = Meal.all.order("created_at DESC")
  end

  def new
    @meal = Meal.new
  end
end
