class Product < ApplicationRecord
  belongs_to :category, class_name: "ProductCategory", foreign_key: "productCategory_id"
end
