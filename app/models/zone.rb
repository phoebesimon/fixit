class Zone < ActiveRecord::Base
  attr_accessible :name
  has_many :buildings
  has_many :areas, :through => :buildings

end
