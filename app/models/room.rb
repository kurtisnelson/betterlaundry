class Room < ActiveRecord::Base
  validates :lvid, uniqueness: true
  validates :name, uniqueness: true
  has_many :machines

  def utilization
    return 100 unless machines.count > 0
    in_use = machines.where("remaining IS NOT NULL").count
    return (in_use.to_f/machines.count*100).to_i
  end

  def washers
    machines.washers
  end

  def dryers
    machines.driers
  end
end
