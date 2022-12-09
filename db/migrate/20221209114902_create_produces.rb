class CreateProduces < ActiveRecord::Migration[7.0]
  def change
    create_table :produces do |t|
      t.string :name
      t.decimal :quantity
      t.string :units
      t.decimal :unit_price
      t.string :img_url
      t.integer :farmer_id

      t.timestamps
    end
  end
end
