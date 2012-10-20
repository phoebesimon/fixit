class Building < ActiveRecord::Base
  attr_accessible :name, :zone
  has_many :areas
  belongs_to :zone
end
