class InventoryFood < ApplicationRecord
    belongs_to :food, class_name: "Food", foreign_key: "foods_id"
    belongs_to :inventory, class_name: "Inventory", foreign_key: "inventory_id"
end