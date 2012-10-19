class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :name, :phone, :email, :default_zone, :default_building
  has_many :requests
end
