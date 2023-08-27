# frozen_string_literal: true

class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.integer :quantity
      t.string :category
      t.string :brand
      t.string :supplier
      t.string :serial
      t.string :warranty
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :inventory_items, :name, unique: true
  end
end
