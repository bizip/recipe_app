class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  belongs_to :user, foreign_key: 'user_id'
  has_many :inventory_foods
  has_many :foods, through: :inventory_foods
end
