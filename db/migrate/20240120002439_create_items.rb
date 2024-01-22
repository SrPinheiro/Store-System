class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.decimal :priceOff
      
      t.timestamps
    end
  end
end
