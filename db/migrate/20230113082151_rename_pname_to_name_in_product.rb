class RenamePnameToNameInProduct < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :pdetail, :detail
    rename_column :products, :pname, :name
  end
end
