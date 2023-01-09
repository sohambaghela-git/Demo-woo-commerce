class RenameStatusToRoleInUserModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :status, :role
  end
end
