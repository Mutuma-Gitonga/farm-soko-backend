class CreateSalePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_purchases do |t|
      t.integer :consumer_id
      t.integer :produce_id

      t.timestamps
    end
  end
end
