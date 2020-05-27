class RestaurantMenu < ApplicationRecord
      self.table_name = 'RestaurantMenu'
      has_many :menu_class,class_name: MenuClass.name,foreign_key: "menu_id"
end
