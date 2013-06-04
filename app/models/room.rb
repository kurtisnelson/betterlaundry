class Room < ActiveRecord::Base
  validates :lvid, uniqueness: true
  validates :name, uniqueness: true
  has_many :machines

  def utilization
    in_use = machines.where(remaining: 1..9999).count
    return (in_use.to_f/machines.count*100).to_i
  end
end
