class Order < ApplicationRecord
  validates :buyer, uniqueness: { scope: [:description, :unit_price, :quantity, :address, :provider] }
end
