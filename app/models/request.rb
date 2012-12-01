class Request < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :location_id, :status, :tag_number, :description, :reject_reason, :location_description, :item_description, :accept_date, :reject_date, :created_at, :updated_at, :area_id, :request_number, :user, :area

  belongs_to :user, :foreign_key => "user_id"
  belongs_to :area, :foreign_key => "area_id"
  has_one :building, :through => :area
  has_one :zone, :through => :building

  validates_presence_of :area, :message => "Choose a Location"
  validates_presence_of :name, :message => "Enter a name"
  validates_presence_of :description, :message => "Enter a description"
  validates_format_of :phone, :with => /^[\(\)0-9\- \+\.]{10,20}$/, :message => "Enter a phone number"
  validates_format_of :email, :with => /^[a-zA-Z0-9._-]+@berkeley.edu$/, :message => "Enter a Berkeley email address"

  def to_list
    toReturn =  ["Name: #{name}", "Phone Number: #{phone}", "Email: #{email}", "Zone: #{zone}", "Building: #{building}", "Area: #{area}", "Description: #{description}"]
    return toReturn
  end

end
