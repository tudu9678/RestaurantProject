class CreateRestaurantMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_menus do |t|

      t.timestamps
    end
  end
end
