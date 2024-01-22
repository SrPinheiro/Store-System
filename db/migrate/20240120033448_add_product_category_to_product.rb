class AddProductCategoryToProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :productCategory, null: false, foreign_key: {to_table: :product_categories}
  end
end
