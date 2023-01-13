class User < ApplicationRecord
  # Associated with products and orders
  has_secure_password
	has_many :products
  has_many :orders
  # validateion for user registration 
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 5..10 }
  validates :role, presence: true
  validates :password_confirmation, confirmation: true
end
