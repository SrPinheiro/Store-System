class AddColumnToItem < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :amount, :decimal, :null => false, :default => 1
    #Ex:- :default =>''
  end
end
