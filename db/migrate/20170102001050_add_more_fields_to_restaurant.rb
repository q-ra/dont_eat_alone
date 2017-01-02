class AddMoreFieldsToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :delivery_price, :float
    add_column :restaurants, :minimal_delivery_price, :float
    add_column :restaurants, :free_delivery, :float
  end
end
