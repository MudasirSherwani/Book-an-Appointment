class Doctor < ApplicationRecord
  has_many :appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  validates :name, :city, :description, :speciality, presence: true, length: { minimum: 3, maximum: 50 }
end
