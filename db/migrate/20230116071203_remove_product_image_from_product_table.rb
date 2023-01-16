class RemoveProductImageFromProductTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :product_image
  end
end
