class User < ActiveRecord::Base
  attr_accessible :uid
  has_many :requests
end
