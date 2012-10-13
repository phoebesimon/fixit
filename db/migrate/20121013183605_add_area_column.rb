class AddAreaColumn < ActiveRecord::Migration
  def up
    add_column :requests, :area, :string
  end

  def down
    remove_column :requests, :area
  end
end
