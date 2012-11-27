class UserTableOnlyUid < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :phone
    remove_column :users, :email
    remove_column :users, :default_zone
    remove_column :users, :default_building
    add_column :users, :uid, :string
  end

  def down
    add_column :users, :name
    add_column :users, :phone
    add_column :users, :email
    add_column :users, :default_zone
    add_column :users, :default_building
    remove_column :users, :uid
  end
end

