class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :road
      t.string :number
      t.string :neighborhood
      t.string :city, default: "Almenara"
      t.string :state, default: "MG"
      
      t.timestamps
    end
  end
end
