class Room < ActiveRecord::Base
  validates :lvid, uniqueness: true
  validates :name, uniqueness: true
  has_many :machines
end
