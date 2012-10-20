class RemoveAreaString < ActiveRecord::Migration
  def up
    remove_column :requests, :area
  end

  def down
    add_column :requests, :area, :string
  end
end
