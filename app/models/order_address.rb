class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :meal_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token, presence: { message: "を正しく入力してください"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は(-)を含めてください"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :meal_id
  end

  validates :area_id, numericality: {other_than: 1, message: "を選択してください" }

  def save
    order = Order.create(meal_id: meal_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, user_id: user_id)
  end
end