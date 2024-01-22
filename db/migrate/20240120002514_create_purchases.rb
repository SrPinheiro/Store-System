class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.decimal :totalValue

      t.timestamps
    end
  end
end
