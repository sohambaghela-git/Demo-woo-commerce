class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders
  validates :pname, presence: true
  validates :pdetail, presence: true
end
