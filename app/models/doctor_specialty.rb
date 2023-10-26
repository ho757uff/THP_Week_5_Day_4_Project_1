class DoctorSpecialty < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialty

  has_many :doctor_specialties
  has_many :doctors, through: :doctor_specialties
end
