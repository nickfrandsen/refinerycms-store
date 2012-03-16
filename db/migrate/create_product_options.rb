class CreateProductOptions < ActiveRecord::Migration
  def self.up
    create_table :product_options do |t|
      t.string :option_name
      t.decimal :price_override
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :product_options
  end
end