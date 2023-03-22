class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: 'user_id'
  has_many :inventories, foreign_key: 'user_id'

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
