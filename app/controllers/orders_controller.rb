class OrdersController < ApplicationController
before_action :authenticate_user!
before_action :set_meal, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_meal
      @order_address.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, meal_id: @meal.id, token: params[:token])
  end

  def pay_meal
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @meal.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
