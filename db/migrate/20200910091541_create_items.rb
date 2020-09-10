class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.text :description,             null: false
      t.integer :category,             null: false
      t.integer :price,                null: false
      t.integer :status,               null: false
      t.integer :delivary_time,        null: false
      t.integer :consignor_area,       null: false
      t.integer :sipping_costs_burden, null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
