class ChangeUserNameToName < ActiveRecord::Migration
  def up
    rename_column :requests, :user_name, :name
  end

  def down
    rename_column :requests, :name, :user_name
  end
end
