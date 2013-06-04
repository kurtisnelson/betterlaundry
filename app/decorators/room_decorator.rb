class RoomDecorator < Draper::Decorator
  delegate_all
  decorates_association :machines

end
