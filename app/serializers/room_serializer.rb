class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_synced
end
