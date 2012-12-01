class User < ActiveRecord::Base
  attr_accessible :uid, :admin_flag
  has_many :requests
end
