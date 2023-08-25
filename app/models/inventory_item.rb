# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  belongs_to :user
  belongs_to :item_category

  validates :name, presence: true
end
