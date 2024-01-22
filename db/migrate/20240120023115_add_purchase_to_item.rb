class AddPurchaseToItem < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :purchase, null: false, foreign_key: true
  end
end
