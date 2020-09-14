class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :zip,                     null: false
      t.integer :purefecture_id,         null: false
      t.string :city,                    null: false
      t.string :reference,               null: false
      t.string :building
      t.string :phone_number,            null: false
      t.integer :purchanse_id,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
