class CreateMenuClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_classes do |t|

      t.timestamps
    end
  end
end
