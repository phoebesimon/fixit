class Area < ActiveRecord::Base
  attr_accessible :name, :building
  belongs_to :building
end
