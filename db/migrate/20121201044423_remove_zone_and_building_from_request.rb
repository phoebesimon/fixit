class RemoveZoneAndBuildingFromRequest < ActiveRecord::Migration
  def up
    remove_column :requests, :zone
    remove_column :requests, :building
  end

  def down
    add_column :requests, :zone, :string
    add_column :requests, :building, :string
  end
end
