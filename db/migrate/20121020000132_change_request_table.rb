class ChangeRequestTable < ActiveRecord::Migration
  def up
    remove_column :requests, :location_id
    add_column :requests, :area_id, :integer
    add_column :requests, :user_id, :integer

  end

  def down
    add_column :requests, :location_id
    remove_column :requests, :area_id
    remove_column :requests, :user_id
  end
end
