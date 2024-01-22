class Purchase < ApplicationRecord
  has_many :items, class_name: 'Item', foreign_key: 'purchase_id', dependent: :destroy
end
