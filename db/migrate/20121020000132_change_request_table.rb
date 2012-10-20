class ChangeRequestTable < ActiveRecord::Migration
  def up
    drop_column :requests, :location_id
    add_column :requests, :area_id, :integer
    add_column :requests, :user_id, :integer

  end

  def down
    add_column :requests, :location_id
    drop_column :requests, :area_id
    drop_column :requests, :user_id
  end
end
