class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :flat_type, presence: true, inclusion: { in: %w(flat room) }
  validates :number_of_rooms, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_month, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :separation_allowed, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
