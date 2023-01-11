class Product < ApplicationRecord
  belongs_to :user, optional: true
  validates :pname, presence: true
  validates :pdetail, presence: true
end
