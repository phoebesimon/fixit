class Area < ActiveRecord::Base
  attr_accessible :name, :building
  belongs_to :building

  def to_s
    return "#{name}"
  end
end
