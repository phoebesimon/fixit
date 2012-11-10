class Request < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :zone, :building, :location_id, :status, :tag_number, :description, :reject_reason, :location_description, :item_description, :accept_date, :reject_date, :created_at, :updated_at, :area_id, :area, :request_number

  belongs_to :user, :foreign_key => "user_id"
  belongs_to :area, :foreign_key => "area_id"
  validates_presence_of :name, :message => "Enter a name"
  validates_presence_of :description, :message => "Enter a description"
  validates_format_of :phone, :with => /^[\(\)0-9\- \+\.]{10,20}$/, :message => "Enter a phone number"
  validates_format_of :email, :with => /^[a-zA-Z0-9._-]+@berkeley.edu$/, :message => "Enter a Berkeley email address"

=begin  def to_s
    return "Name: #{name} \nPhone Number: #{phone} \nEmail: #{email} \nZone: #{zone} \nBuilding: #{building} \nArea: #{area} \nCreated At: #{created_at} \nDescription: #{description}"
  end
=end

  def to_list
    return ["Name: #{name}", "Phone Number: #{phone}", "Email: #{email}", "Zone: #{zone}", "Building: #{building}", "Area: #{area}", "Description: #{description}"]
  end

end
