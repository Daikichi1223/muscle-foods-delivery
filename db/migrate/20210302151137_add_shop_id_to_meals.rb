class AddShopIdToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :shop_id, :integer
  end
end
