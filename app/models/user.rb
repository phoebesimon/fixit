class User < ActiveRecord::Base
  attr_accessible :uid
  attr_accessor :uid
  has_many :requests
end
