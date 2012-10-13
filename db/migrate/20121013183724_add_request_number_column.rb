class AddRequestNumberColumn < ActiveRecord::Migration
  def up
    add_column :requests, :request_number, :string
  end

  def down
    remove_column :requests, :request_number
  end
end
