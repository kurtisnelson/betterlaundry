class MachineDecorator < Draper::Decorator
  delegate_all

  def percent
    return 100 unless source.remaining
    if machine.kind == "washer"
      progress = (40 - source.remaining)/40.0
    else
      progress = (60 - source.remaining)/60.0
    end
    progress*100
  end

  def progress_bar_class
    style = ["progress-bar"]
    if source.out_of_service?
      style << "progress-bar-danger"
    elsif source.remaining == nil
      style << "progress-bar-success"
    elsif source.remaining == 0
      style << "progress-bar-striped"
      style << "progress-bar-warning"
    else
      style << "progress-bar-danger"
      style << "progress-bar-striped"
      style << "active"
    end
    style.join ' '
  end
end
