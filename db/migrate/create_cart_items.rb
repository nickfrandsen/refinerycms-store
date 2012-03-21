class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :product_option_id
      t.integer :quantity
      t.decimal :price
      t.integer :cart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end