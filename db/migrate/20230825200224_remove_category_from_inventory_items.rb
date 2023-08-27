# frozen_string_literal: true

class RemoveCategoryFromInventoryItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventory_items, :category, :string
  end
end
