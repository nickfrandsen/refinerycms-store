class CreateProductOptions < ActiveRecord::Migration
  def self.up
    create_table :product_options do |t|
      t.string :name
      t.decimal :price
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :product_options
  end
end