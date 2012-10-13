class Request < ActiveRecord::Base
  attr_accessible :name, :phone, :email, :zone, :building, :location_id, :status, :tag_number, :description, :reject_reason, :location_description, :item_description, :accept_date, :reject_date, :created_at, :updated_at, :area, :request_number
end
