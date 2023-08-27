# frozen_string_literal: true

class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.string :name
      t.text :description
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
    add_index :item_categories, :name, unique: true
  end
end
