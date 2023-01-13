class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :shipping_address, presence: true
  validates :transaction_id, uniqueness: true
end
