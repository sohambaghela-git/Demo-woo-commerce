class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :pname
      t.string :pdetail
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
