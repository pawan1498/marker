class AddAdminColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :active, :boolean, default: true
  end
end
