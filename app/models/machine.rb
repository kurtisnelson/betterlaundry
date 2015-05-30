class Machine < ActiveRecord::Base
  belongs_to :room
  default_scope ->{ order(:number) }
  scope :available, ->{ where(remaining: nil, out_of_service: false)}
  scope :washers, ->{ where(kind: "washer")}
  scope :driers, ->{ where(kind: "dryer")}

  def available?
    remaining == nil
  end

  def done?
    remaining == 0
  end

  def busy?
    remaining != nil
  end
end
