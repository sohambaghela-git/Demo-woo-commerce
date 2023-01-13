class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :product_image
  has_many :orders
  validates :name, presence: true
  validates :detail, presence: true
  validate :acceptable_image

  private
  def acceptable_image
    return unless product_image.attached?
  end
end