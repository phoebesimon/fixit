class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 'name'
      t.string 'phone'
      t.string 'email'
      t.string 'default_zone'
      t.string 'default_building'
      t.timestamps
    end
  end
end
