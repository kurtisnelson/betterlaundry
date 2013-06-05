class MachineSerializer < ActiveModel::Serializer
  attributes :id, :number, :remaining, :status
  has_one :room
end
