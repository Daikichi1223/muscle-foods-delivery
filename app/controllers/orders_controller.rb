class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :set_item, only: [:index, :create]

  def index
    
  end

  private
  def set_item
    @meal = Meal.find(params[:meal_id])
  end
end
