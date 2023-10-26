class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments # MAJ : through: :appointments

  belongs_to :city # MAJ : belongs_to :city

  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties #MAJ : through: :doctor_specialties
end
