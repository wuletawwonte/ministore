# frozen_string_literal: true

class AddColumnToInventoryItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_items, :item_category, null: false, foreign_key: true
  end
end
