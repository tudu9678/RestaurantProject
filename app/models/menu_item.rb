class MenuItem < ApplicationRecord
    self.table_name = 'MenuItems'
    belongs_to :menu_class, class_name: MenuClass.name,foreign_key: "class_id"
end
