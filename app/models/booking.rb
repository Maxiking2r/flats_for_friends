class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :messages, dependent: :destroy
  validates :start_date, :end_date, presence: true
  # validates :end_date_after_start_date
  validates :confirmed, inclusion: { in: %w(declined pending confirmed) }
  accepts_nested_attributes_for :messages

  def booked_date_range
    { from: :start_date, to: :end_date }
  end

 private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
