class InventoryFood < ApplicationRecord
  belongs_to :food, foreign_key: 'foods_id'
  belongs_to :inventory, foreign_key: 'inventory_id'
end
