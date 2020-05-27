class MenuClass < ApplicationRecord
    self.table_name = 'MenuClass'
    belongs_to :restaurant_menu,class_name: RestaurantMenu.name,foreign_key: "menu_id"
    has_many :menu_item ,class_name: MenuItem.name,foreign_key: "class_id"
end
