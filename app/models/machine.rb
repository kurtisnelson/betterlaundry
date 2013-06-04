class Machine < ActiveRecord::Base
  belongs_to :room
  default_scope ->{order(:number)}
end
