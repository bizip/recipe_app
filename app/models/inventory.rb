class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :inventory_foods
end
