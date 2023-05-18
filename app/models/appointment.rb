class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :disease, :city, :appointment_date, :appointment_time, presence: true
end
