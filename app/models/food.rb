class Food < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', counter_cache: true
end