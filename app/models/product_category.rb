class ProductCategory < ApplicationRecord
  has_many :products, class_name: "Product", foreign_key: "productCategory_id"

  after_find do |category|
    puts category.name
  end
end
