# frozen_string_literal: true

class InventoryItem < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
