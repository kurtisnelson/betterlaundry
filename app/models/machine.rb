class Machine < ActiveRecord::Base
  belongs_to :room
  default_scope order: :number
  scope :washers, where(type: "washer")
  scope :dryer, where(type: "dryer")
end
