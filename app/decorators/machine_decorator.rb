class MachineDecorator < Draper::Decorator
  delegate_all

  def percent
    percent = (source.remaining/60.0)*100
    percent = 0 unless percent > 0
    percent
  end
end
