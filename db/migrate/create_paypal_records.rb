class CreatePaypalRecords < ActiveRecord::Migration
  def self.up
    create_table :paypal_records do |t|
      t.text :params

      t.timestamps
    end
  end

  def self.down
    drop_table :paypal_records
  end
end
