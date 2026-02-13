class Specialty < ApplicationRecord
  has_many :join_table_doctor_specialties
  has many :doctors, through :join_table_doctor_specialties
end
