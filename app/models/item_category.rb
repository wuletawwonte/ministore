# frozen_string_literal: true

class ItemCategory < ApplicationRecord
  belongs_to :users
  has_many :inventory_items
end
