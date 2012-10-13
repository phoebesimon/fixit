class CreateRequests < ActiveRecord::Migration
  def up
    create_table 'requests' do |t|
      t.string 'user_name'
      t.string 'phone'
      t.string 'email'
      t.string 'zone'
      t.string 'building'
      t.string 'location_id'
      t.string 'status'
      t.string 'tag_number'
      t.text 'description'
      t.text 'reject_reason'
      t.text 'location_description'
      t.text 'item_description'
      t.datetime 'accept_date'
      t.datetime 'reject_date'
      t.timestamps
    end
  end

  def down
    drop_table 'requests'
  end
end
