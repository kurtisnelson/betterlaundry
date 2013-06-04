class RoomDecorator < Draper::Decorator
  delegate_all
  decorates_association :machines

  def bar_type
    return "progress-success" if source.utilization < 50
    return "progress-warning" if source.utilization < 95
    "progress-danger"
  end
end
