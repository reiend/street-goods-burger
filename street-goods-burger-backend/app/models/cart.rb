# frozen_string_literal: true

# Cart Template
class Cart < ApplicationRecord
  belongs_to :store_transaction
  has_many :food_orders

  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than: -1 }
  validates :total_price,
            presence: true,
            numericality: { greater_than: -0.99 }

  validates :deliver_address, length: { minimum: 0, maximum: 256 }
end
